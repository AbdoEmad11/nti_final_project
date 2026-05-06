import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';
import 'package:nti_final_project/features/addProduct/view/cubits/add_product_cubit.dart';
import 'package:nti_final_project/features/addProduct/view/cubits/add_product_state.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _arabicNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _descriptionArabicController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _colorController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _arabicNameController.dispose();
    _descriptionController.dispose();
    _descriptionArabicController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddProductCubit(),
      child: BlocConsumer<AddProductCubit, AddProductState>(
        listener: (context, state) {
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: context.appTheme.error,
              ),
            );
          }

          if (state.isSuccess) {
            _nameController.clear();
            _arabicNameController.clear();
            _descriptionController.clear();
            _descriptionArabicController.clear();
            _priceController.clear();
            _stockController.clear();
            _colorController.clear();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage ?? 'Product added successfully'),
                backgroundColor: context.appTheme.success,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AddProductCubit>();
          return Scaffold(
            backgroundColor: context.appTheme.background,
            appBar: AppBar(
              title: const Text('Add Product'),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildField(
                        controller: _nameController,
                        label: 'Name',
                        hint: 'Enter product name',
                        onChanged: cubit.onNameChanged,
                      ),
                      const SizedBox(height: 12),
                      _buildField(
                        controller: _arabicNameController,
                        label: 'Arabic Name',
                        hint: 'اكتب اسم المنتج بالعربي',
                        onChanged: cubit.onArabicNameChanged,
                      ),
                      const SizedBox(height: 12),
                      _buildField(
                        controller: _descriptionController,
                        label: 'Description',
                        hint: 'Enter product description',
                        maxLines: 3,
                        onChanged: cubit.onDescriptionChanged,
                      ),
                      const SizedBox(height: 12),
                      _buildField(
                        controller: _descriptionArabicController,
                        label: 'Description Arabic',
                        hint: 'اكتب وصف المنتج بالعربي',
                        maxLines: 3,
                        onChanged: cubit.onDescriptionArabicChanged,
                      ),
                      const SizedBox(height: 12),
                      _buildField(
                        controller: _priceController,
                        label: 'Price',
                        hint: 'Enter price',
                        keyboardType: TextInputType.number,
                        onChanged: cubit.onPriceChanged,
                      ),
                      const SizedBox(height: 12),
                      _buildField(
                        controller: _stockController,
                        label: 'Stock',
                        hint: 'Enter stock quantity',
                        keyboardType: TextInputType.number,
                        onChanged: cubit.onStockChanged,
                      ),
                      const SizedBox(height: 12),
                      _buildField(
                        controller: _colorController,
                        label: 'Color',
                        hint: 'Enter color',
                        onChanged: cubit.onColorChanged,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: state.isLoading ? null : cubit.submit,
                          child: state.isLoading
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Text('Add Product'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Builder(
      builder: (context) => TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: TextStyle(color: context.appTheme.textPrimary),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
