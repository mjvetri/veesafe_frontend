import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../models/product_model.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/product_list_card.dart';

class ProductsPage extends StatefulWidget {
  final VoidCallback? onBack;
  const ProductsPage({super.key, this.onBack});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All (13)', 'Active (10)', 'Devices', 'Equipments'];

  List<ProductModel> get _filteredProducts {
    switch (_selectedFilter) {
      case 1:
        return sampleProducts.where((p) => p.tag == ProductTag.active).toList();
      case 2:
        return sampleProducts.where((p) => p.tag == ProductTag.newTag).toList();
      case 3:
        return sampleProducts.where((p) => p.tag == ProductTag.hot).toList();
      default:
        return sampleProducts;
    }
  }

  // ✅ Add Product button → full form sheet திறக்கும்
  void _openAddProduct() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _AddProductSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          SubPageHeader(
            title: AppStrings.productsTitle,
            subtitle: AppStrings.productsSub,
            onBack: widget.onBack,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                children: [
                  const AppSearchBar(hint: AppStrings.searchProduct),
                  FilterRow(
                    items: _filters,
                    selected: _selectedFilter,
                    onSelect: (i) => setState(() => _selectedFilter = i),
                    topPad: 4,
                  ),
                  if (_filteredProducts.isEmpty)
                    const _EmptyProducts()
                  else
                    ProductListCard(
                      title: 'Products (${_filteredProducts.length})',
                      products: _filteredProducts,
                    ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddProduct, // ✅ இப்போ work ஆகுது!
        backgroundColor: AppColors.navy,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add Product',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w800)),
      ),
    );
  }
}

// ✅ Full Add Product Form Sheet
class _AddProductSheet extends StatefulWidget {
  const _AddProductSheet();

  @override
  State<_AddProductSheet> createState() => _AddProductSheetState();
}

class _AddProductSheetState extends State<_AddProductSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl    = TextEditingController();
  final _asinCtrl    = TextEditingController();
  final _priceCtrl   = TextEditingController();
  final _qtyCtrl     = TextEditingController();
  final _descCtrl    = TextEditingController();
  String _selectedTag = 'Active';
  String _selectedEmoji = '💊';
  bool _isLoading = false;

  final List<String> _tags    = ['Active', 'HOT', 'NEW'];
  final List<String> _emojis  = ['💊','🛏️','🩺','🩸','🫁','♿','🩻','🔬','🧬','💉','🩹','🏥'];

  @override
  void dispose() {
    _nameCtrl.dispose();
    _asinCtrl.dispose();
    _priceCtrl.dispose();
    _qtyCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() => _isLoading = false);
    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Text(_selectedEmoji, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${_nameCtrl.text} added successfully!',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.navy,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        initialChildSize: 0.88,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // ── Handle + Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 40, height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.border,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Add New Product',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: AppColors.navy)),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 30, height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.bg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.close_rounded,
                                color: AppColors.muted, size: 18),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Divider(color: AppColors.border),
                  ],
                ),
              ),

              // ── Scrollable Form
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    controller: controller,
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    children: [

                      // Emoji picker
                      _Label('Product Icon'),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 48,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _emojis.length,
                          itemBuilder: (_, i) {
                            final selected = _emojis[i] == _selectedEmoji;
                            return GestureDetector(
                              onTap: () => setState(() => _selectedEmoji = _emojis[i]),
                              child: Container(
                                width: 44, height: 44,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: selected ? AppColors.navy : AppColors.bg,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: selected ? AppColors.navy : AppColors.border,
                                    width: selected ? 2 : 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(_emojis[i],
                                      style: const TextStyle(fontSize: 20)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Product Name
                      _Label('Product Name *'),
                      const SizedBox(height: 6),
                      _FormField(
                        controller: _nameCtrl,
                        hint: 'e.g. Hospital Bed Deluxe Pro',
                        validator: (v) =>
                            (v == null || v.trim().isEmpty) ? 'Product name required' : null,
                      ),
                      const SizedBox(height: 14),

                      // ASIN
                      _Label('ASIN / SKU'),
                      const SizedBox(height: 6),
                      _FormField(
                        controller: _asinCtrl,
                        hint: 'e.g. DT-HB007',
                      ),
                      const SizedBox(height: 14),

                      // Price + Qty row
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _Label('Price (\$) *'),
                                const SizedBox(height: 6),
                                _FormField(
                                  controller: _priceCtrl,
                                  hint: '0.00',
                                  keyboardType: TextInputType.number,
                                  validator: (v) =>
                                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _Label('Quantity *'),
                                const SizedBox(height: 6),
                                _FormField(
                                  controller: _qtyCtrl,
                                  hint: '0',
                                  keyboardType: TextInputType.number,
                                  validator: (v) =>
                                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Status tag
                      _Label('Product Status'),
                      const SizedBox(height: 8),
                      Row(
                        children: _tags.map((tag) {
                          final isSelected = _selectedTag == tag;
                          Color bg, fg;
                          if (tag == 'Active') {
                            bg = isSelected ? const Color(0xFFE0F7F4) : AppColors.bg;
                            fg = const Color(0xFF0D6E5F);
                          } else if (tag == 'HOT') {
                            bg = isSelected ? const Color(0xFFFFF0F0) : AppColors.bg;
                            fg = AppColors.red;
                          } else {
                            bg = isSelected ? const Color(0xFFFFF4E6) : AppColors.bg;
                            fg = AppColors.orange;
                          }
                          return GestureDetector(
                            onTap: () => setState(() => _selectedTag = tag),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 7),
                              decoration: BoxDecoration(
                                color: bg,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected ? fg : AppColors.border,
                                  width: isSelected ? 1.5 : 1,
                                ),
                              ),
                              child: Text(tag,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      color: isSelected ? fg : AppColors.muted)),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 14),

                      // Description
                      _Label('Description (optional)'),
                      const SizedBox(height: 6),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.bg,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: TextFormField(
                          controller: _descCtrl,
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.navy),
                          decoration: const InputDecoration(
                            hintText: 'Product description...',
                            hintStyle: TextStyle(
                                color: AppColors.muted,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Preview card
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.bg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44, height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.iconNavy,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(_selectedEmoji,
                                    style: const TextStyle(fontSize: 22)),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _nameCtrl.text.isEmpty
                                        ? 'Product Name Preview'
                                        : _nameCtrl.text,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: _nameCtrl.text.isEmpty
                                            ? AppColors.muted
                                            : AppColors.navy),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    _asinCtrl.text.isEmpty
                                        ? 'ASIN: —'
                                        : 'ASIN: ${_asinCtrl.text}',
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: AppColors.muted,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _priceCtrl.text.isEmpty
                                      ? '\$—'
                                      : '\$${_priceCtrl.text}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.navy),
                                ),
                                Text(
                                  _qtyCtrl.text.isEmpty
                                      ? 'Qty: —'
                                      : 'Qty: ${_qtyCtrl.text}',
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColors.sub,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Submit button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.navy,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 0,
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('Add Product',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Helper Widgets
class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: AppColors.sub,
            letterSpacing: 0.3));
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.navy),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              color: AppColors.muted,
              fontSize: 13,
              fontWeight: FontWeight.w500),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          isDense: true,
          errorStyle: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

class _EmptyProducts extends StatelessWidget {
  const _EmptyProducts();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Text('📦', style: TextStyle(fontSize: 42)),
          SizedBox(height: 12),
          Text(
            'No products found\nfor this filter.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13,
                color: AppColors.muted,
                fontWeight: FontWeight.w600,
                height: 1.5),
          ),
        ],
      ),
    );
  }
}