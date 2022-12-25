part of 'screens.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productDescController = TextEditingController();
  final TextEditingController productVariantsController =
      TextEditingController();
  final TextEditingController productCategoryController =
      TextEditingController();

  void reset() {
    //kita hapus name controller
    productNameController.clear();
    //kita hapus price controller
    productPriceController.clear();
    //kita hapus desc controller
    productDescController.clear();
    //kita hapus variant controller
    productVariantsController.clear();
    productCategoryController.clear();
    //kita hapus state image picker
    BlocProvider.of<ProductPictureCubit>(context).resetImage();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        reset();
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: 'Tambah Produk'.text.make(),
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
        ),
        body: BlocConsumer<AdminBloc, AdminState>(
          listener: (context, state) {
            if (state is AdminIsSuccess) {
              reset();
              Commons().showSnackBar(context, state.message);
            } else if (state is AdminIsFailed) {
              Commons().showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            return VStack([
              _buildProductForm(),
              ButtonWidget(
                color: kPrimaryColor,
                onPressed: () {
                  BlocProvider.of<AdminBloc>(context).add(AddProduct(
                    name: productNameController.text,
                    price: double.parse(productPriceController.text),
                    desc: productDescController.text,
                    variants: productVariantsController.text,
                    category: productCategoryController.text,
                  ));
                },
                isLoading: (state is AdminIsLoading) ? true : false,
                text: 'Unggah Produk',
              ).px16()
            ]);
          },
        ),
      ),
    );
  }

  //TODO: Widget Form (Nama Produk DONE, Harga DONE, Poto)
  Widget _buildProductForm() {
    return VStack([
      TextFieldWidget(
        controller: productNameController,
        title: 'Nama Produk',
      ),
      8.heightBox,
      TextFieldWidget(
        controller: productPriceController,
        title: 'Harga Produk',
      ),
      8.heightBox,
      TextFieldWidget(
        controller: productDescController,
        maxLines: 4,
        title: 'Deskripsi Produk',
      ),
      8.heightBox,
      TextFieldWidget(
        controller: productVariantsController,
        title: 'Variant Produk',
      ),
      8.heightBox,
      TextFieldWidget(
        controller: productCategoryController,
        title: 'Category Produk',
      ),
      8.heightBox,
      BlocBuilder<ProductPictureCubit, ProductPictureState>(
        builder: (context, state) {
          if (state is ProductPictureIsLoaded && state.files.isNotEmpty) {
            return AspectRatio(
                aspectRatio: 16 / 7,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return (index == state.files.length)
                          ? _buildAddImageButton(context)
                          : _buildImage(
                              context: context,
                              image: state.files[index],
                              index: index);
                    },
                    separatorBuilder: (context, index) => 16.widthBox,
                    itemCount: state.files.length + 1));
          }
          return _buildAddImageButton(context);
        },
      )
    ]).p16();
  }

  Widget _buildAddImageButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<ProductPictureCubit>(context).getImage();
      },
      icon: const Icon(Icons.add_a_photo_rounded),
    ).box.color(colorName.white.withOpacity(.8)).roundedFull.make();
  }

  Widget _buildImage(
      {required BuildContext context,
      required File image,
      required int index}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ZStack(
        [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            onPressed: () {
              BlocProvider.of<ProductPictureCubit>(context).deleteImage(index);
            },
            icon: const Icon(Icons.delete_forever),
          ).box.color(colorName.white.withOpacity(.8)).roundedFull.make(),
        ],
        alignment: Alignment.center,
      ),
    );
  }
}
