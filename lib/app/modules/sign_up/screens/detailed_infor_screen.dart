import 'package:flutter/material.dart';
import 'package:school_violence_app/app/core/values/app_colors.dart';
import 'package:school_violence_app/app/modules/sign_up/widgets/date_of_birth_field.dart';
import 'package:school_violence_app/app/modules/sign_up/widgets/full_name_field.dart';
import 'package:school_violence_app/app/modules/sign_up/widgets/phone_number_field.dart';
import 'package:school_violence_app/app/modules/sign_up/widgets/formhelper_and_picker.dart';
import 'package:school_violence_app/app/modules/sign_up/sign_up_controller.dart';
import 'package:get/get.dart';
import 'package:school_violence_app/app/modules/sign_up/widgets/sign_up_button.dart';

SingleChildScrollView detailedInfor(BuildContext context) {
  final SignUpController ctrl = Get.find<SignUpController>();
  String? countryId;
  String? provinceId;
  String? cityId;
  String? schoolId;
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: 35),
        Text(
          'Create an account',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Please complete your profile.\nDon’t worry, your data will remain in private and\nonly you can see it.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Full Name',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
            FullNameField(),
            SizedBox(height: 20),
            const Text(
              'Date of Birth',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
            DateOfBirthField(),
            SizedBox(height: 20),
            const Text(
              'Phone Number',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
            PhoneNumberField(),
            SizedBox(height: 20),

            // Coutry

            const Text(
              'Country',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
            FormHelper.dropDownWidget(
              context,
              '',
              countryId,
              Picker().countries,
              (onChangedVal) {
                countryId = onChangedVal;
                ctrl.updateProvince(Picker()
                    .province
                    .where(
                      (element) =>
                          element['ParentId'].toString() ==
                          onChangedVal.toString(),
                    )
                    .toList());
                provinceId = '';
              },
              (onValidateVal) {
                onValidateVal == null ? 'Please select country' : null;
              },
              borderColor: AppColors.transparent,
              borderFocusColor: AppColors.primaryColor,
              borderRadius: 0,
              paddingLeft: 0,
              paddingRight: 0,
            ),
            SizedBox(height: 20),

            // Province

            const Text(
              'Province',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
            Obx(
              () => FormHelper.dropDownWidget(
                context,
                '',
                provinceId,
                ctrl.province,
                (onChangedVal) {
                  provinceId = onChangedVal;
                  ctrl.updateCity(Picker()
                      .city
                      .where(
                        (element) =>
                            element['ParentId'].toString() ==
                            onChangedVal.toString(),
                      )
                      .toList());
                  cityId = '';
                },
                (onValidateVal) {
                  onValidateVal == null ? 'Please select province' : null;
                },
                borderColor: AppColors.transparent,
                borderFocusColor: AppColors.primaryColor,
                borderRadius: 0,
                paddingLeft: 0,
                paddingRight: 0,
              ),
            ),

            // city

            const Text(
              'City',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
            Obx(
              () => FormHelper.dropDownWidget(
                context,
                '',
                cityId,
                ctrl.city,
                (onChangedVal) {
                  cityId = onChangedVal;
                  ctrl.updateSchool(Picker()
                      .school
                      .where(
                        (element) =>
                            element['ParentId'].toString() ==
                            onChangedVal.toString(),
                      )
                      .toList());
                  schoolId = '';
                },
                (onValidateVal) {
                  onValidateVal == null ? 'Please select city' : null;
                },
                borderColor: AppColors.transparent,
                borderFocusColor: AppColors.primaryColor,
                borderRadius: 0,
                paddingLeft: 0,
                paddingRight: 0,
              ),
            ),

            // school

            const Text(
              'School',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
            Obx(
              () => FormHelper.dropDownWidget(
                context,
                '',
                schoolId,
                ctrl.school,
                (onChangedVal) {
                  cityId = onChangedVal;
                },
                (onValidateVal) {
                  onValidateVal == null ? 'Please select school' : null;
                },
                borderColor: AppColors.transparent,
                borderFocusColor: AppColors.primaryColor,
                borderRadius: 0,
                paddingLeft: 0,
                paddingRight: 0,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
        SignUpButton(),
      ],
    ),
  );
}