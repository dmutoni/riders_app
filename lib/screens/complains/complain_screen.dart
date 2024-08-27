import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:riders_app/data/models/complain_model.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_level.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_variant.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';
import 'package:riders_app/helpers/snackbar_helper.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';

class ComplainScreen extends StatefulWidget {
  static const String routeName = '/complainScreen';
  const ComplainScreen({super.key});

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  String? selectedComplain;
  bool isUpdating = false;
  int? updatingComplainId;

  final TextEditingController _complainDetailsController =
      TextEditingController();
  final SecureStorageServiceHelper _storageService =
      SecureStorageServiceHelper();

  List<ComplainModel> _complains = [];

  @override
  void initState() {
    super.initState();
    _loadComplains();
  }

  Future<void> _loadComplains() async {
    final complains = await _storageService.getComplaints();
    setState(() {
      _complains = complains;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _complainDetailsController.dispose();
    selectedComplain = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(Dimens.marginDefault),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                ),
                Text(
                  'Back',
                ),
              ],
            ),
          ),
        ),
        title: Text(
          'Complain',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leadingWidth: 100,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.marginDefault),
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                dropdownColor: ThemeColors.white,
                focusColor: ThemeColors.white,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hint: const Text('Select complain'),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimens.marginSmall)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: Dimens.marginDefault,
                  ),
                ),
                value: selectedComplain,
                items: [
                  'Vehicle not clean',
                  'Vehicle arrived late',
                  'Vehicle has mechanical fault',
                ]
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedComplain = value;
                  });
                },
                validator: (value) {
                  if (value == null) return 'Complain is required';
                  return null;
                },
              ),
              const SizedBox(height: Dimens.marginDefault),
              const SizedBox(height: Dimens.marginDefault),
              TextFormField(
                controller: _complainDetailsController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Write your complaint here (minimum 10 characters)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a complaint';
                  } else if (value.length < 10) {
                    return 'Complaint must be at least 10 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: Dimens.marginDefault),
              AppButton(
                title: isUpdating ? 'Update' : 'Submit',
                onTap: () async {
                  final formIsValid = _validateForm();

                  if (!formIsValid) return;

                  if (isUpdating) {
                    await _storageService.updateComplain(
                      id: updatingComplainId!,
                      updatedComplaint: ComplainModel(
                        id: updatingComplainId,
                        complainType: selectedComplain,
                        complain: _complainDetailsController.text,
                        date: DateTime.now(),
                      ),
                    );
                  } else if (selectedComplain != null &&
                      _complainDetailsController.text.isNotEmpty) {
                    int newId = _complains.length + 1;

                    await _storageService.saveComplaint(
                      ComplainModel(
                        id: newId,
                        complainType: selectedComplain,
                        complain: _complainDetailsController.text,
                        date: DateTime.now(),
                      ),
                    );
                  } else {
                    return;
                  }

                  _complainDetailsController.clear();
                  setState(() {
                    selectedComplain = null;
                    isUpdating = false;
                    updatingComplainId = null;
                    _loadComplains();
                  });
                },
              ),
              const SizedBox(height: Dimens.marginBig),
              Text(
                'Recent Reviews',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: Dimens.marginDefault),
              ..._complains
                  .map((complain) => _buildReview(
                        complain,
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReview(
    ComplainModel complain,
  ) {
    return Container(
      padding: const EdgeInsets.all(Dimens.marginSmall),
      margin: const EdgeInsets.all(Dimens.marginSmall),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.lightGreen,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  complain.complainType ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text(
                  complain.complain ?? '',
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Dimens.marginDefault,
          ),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        _complainDetailsController.text =
                            complain.complain ?? '';
                        setState(() {
                          selectedComplain = complain.complainType;
                          isUpdating = true;
                          updatingComplainId = complain.id;
                        });
                      },
                      icon: const Icon(Icons.edit_outlined)),
                  IconButton(
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: ThemeColors.red,
                      ),
                      onPressed: () async {
                        await _storageService.deleteComplaint(complain.id!);
                        _loadComplains();
                      })
                ],
              ),
              Text(
                  DateFormat('kk:mm:a').format(complain.date ?? DateTime.now()))
            ],
          )
        ],
      ),
    );
  }

  bool _validateForm() {
    if (selectedComplain == null) {
      // Show an error message
      SnackbarHelper.showSnackbar(
        context: context,
        message: 'Complain title is required',
        level: AppTopSnackbarLevel.warning,
        variant: AppTopSnackbarVariant.error,
      );
      return false;
    }

    final complainText = _complainDetailsController.text;
    if (complainText.isEmpty) {
      SnackbarHelper.showSnackbar(
        context: context,
        message: 'Please enter a complain',
        level: AppTopSnackbarLevel.warning,
        variant: AppTopSnackbarVariant.error,
      );
      return false;
    } else if (complainText.length < 10) {
      SnackbarHelper.showSnackbar(
        context: context,
        message: 'Complain must be at least 10 characters',
        level: AppTopSnackbarLevel.warning,
        variant: AppTopSnackbarVariant.error,
      );
      return false;
    }

    return true;
  }
}
