import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/add_product_viewmodel.dart';
import '../widgets/product_form_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late AddProductViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AddProductViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Add Product'),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        body: Consumer<AddProductViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name Field
                  ProductFormField(
                    label: 'Product Name',
                    placeholder: 'e.g Minimalist Ceramic Vase',
                    icon: Icons.label_outline,
                    onChanged: viewModel.setProductName,
                    value: viewModel.productName,
                  ),
                  const SizedBox(height: 16),

                  // Price Field
                  ProductFormField(
                    label: 'Price',
                    placeholder: '0.00',
                    icon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    onChanged: viewModel.setPrice,
                    value: viewModel.price > 0
                        ? viewModel.price.toString()
                        : '',
                  ),
                  const SizedBox(height: 16),

                  // Category Dropdown
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.category,
                                color: Color(0xFFA0A0A0),
                                size: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: const SizedBox(),
                                value: viewModel.selectedCategory.isEmpty
                                    ? null
                                    : viewModel.selectedCategory,
                                hint: const Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    'Select Category',
                                    style: TextStyle(color: Color(0xFFA0A0A0)),
                                  ),
                                ),
                                items: viewModel.categories
                                    .map(
                                      (category) => DropdownMenuItem<String>(
                                        value: category,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                          ),
                                          child: Text(category),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    viewModel.setCategory(value);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Stock Quantity Field
                  ProductFormField(
                    label: 'Stock Quantity',
                    placeholder: 'Enter quantity',
                    icon: Icons.inventory_2_outlined,
                    keyboardType: TextInputType.number,
                    onChanged: viewModel.setStockQuantity,
                    value: viewModel.stockQuantity > 0
                        ? viewModel.stockQuantity.toString()
                        : '',
                  ),
                  const SizedBox(height: 16),

                  // Description Field
                  ProductFormField(
                    label: 'Description',
                    placeholder: 'Tell more about the product...',
                    icon: Icons.description_outlined,
                    maxLines: 4,
                    onChanged: viewModel.setDescription,
                    value: viewModel.description,
                  ),
                  const SizedBox(height: 24),

                  // Error Message
                  if (viewModel.errorMessage.isNotEmpty &&
                      !viewModel.errorMessage.contains('successfully'))
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.error, color: Colors.red),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              viewModel.errorMessage,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),

                  // Add Product Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: viewModel.isLoading
                          ? null
                          : () async {
                              await viewModel.addProduct();
                              if (mounted &&
                                  viewModel.errorMessage.contains(
                                    'successfully',
                                  )) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(viewModel.errorMessage),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5B4FFF),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: viewModel.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Add Product',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Delete Product Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: viewModel.isLoading
                          ? null
                          : () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Product?'),
                                  content: const Text(
                                    'Are you sure you want to delete this product?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        await viewModel.deleteProduct();
                                        if (mounted) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                viewModel.errorMessage,
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFFE84C3D),
                          width: 2,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Delete Product',
                        style: TextStyle(
                          color: Color(0xFFE84C3D),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
