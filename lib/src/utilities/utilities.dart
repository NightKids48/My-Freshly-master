import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshly/src/blocs/list_user/list_user_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freshly/src/blocs/blocs.dart';
import 'package:freshly/src/blocs/detail_product/detail_product_bloc.dart';
import 'package:freshly/src/cubits/cubits.dart';
import 'package:freshly/src/screens/screens.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:velocity_x/velocity_x.dart';

part 'router.dart';
part 'colors.dart';
part 'constanta.dart';
part 'commons.dart';
