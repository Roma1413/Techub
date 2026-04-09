import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants.dart';
import '../models/models.dart';

class CheckoutPage extends StatefulWidget {
  final CartManager cartManager;
  final VoidCallback didUpdate;
  final Function(Order) onSubmit;

  const CheckoutPage({
    super.key,
    required this.cartManager,
    required this.didUpdate,
    required this.onSubmit,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  Set<int> _selectedSegment = {0};
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  String _formatDate(DateTime? d) =>
      d == null ? 'Select Date' : DateFormat('MMM d, yyyy').format(d);

  String _formatTime(TimeOfDay? t) {
    if (t == null) return 'Select Time';
    return '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(primary: TechColors.accent, surface: TechColors.surface),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(primary: TechColors.accent, surface: TechColors.surface),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _selectedTime = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(child: _buildScrollContent()),
        _buildSubmitButton(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: TechColors.border)),
      ),
      child: Row(
        children: [
          const Text('Checkout', style: TextStyle(
            color: TechColors.textPrimary, fontSize: 20, fontWeight: FontWeight.w700)),
          const Spacer(),
          Text('\$${widget.cartManager.totalCost.toStringAsFixed(2)}',
            style: const TextStyle(color: TechColors.accent, fontSize: 18, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }

  Widget _buildScrollContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDeliveryToggle(),
          const SizedBox(height: 20),
          _buildContactFields(),
          const SizedBox(height: 20),
          _buildDateTimePickers(),
          const SizedBox(height: 20),
          _buildOrderSummary(),
        ],
      ),
    );
  }

  Widget _buildDeliveryToggle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Delivery Method', style: TextStyle(
          color: TechColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
        const SizedBox(height: 8),
        SegmentedButton<int>(
          showSelectedIcon: false,
          segments: const [
            ButtonSegment(value: 0, label: Text('Delivery'), icon: Icon(Icons.local_shipping_outlined)),
            ButtonSegment(value: 1, label: Text('Store Pickup'), icon: Icon(Icons.store_outlined)),
          ],
          selected: _selectedSegment,
          onSelectionChanged: (val) => setState(() => _selectedSegment = val),
          style: SegmentedButton.styleFrom(
            backgroundColor: TechColors.surfaceHigh,
            selectedBackgroundColor: TechColors.accent.withOpacity(0.15),
            selectedForegroundColor: TechColors.accent,
            foregroundColor: TechColors.textSecondary,
            side: const BorderSide(color: TechColors.border),
          ),
        ),
      ],
    );
  }

  Widget _buildContactFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contact Details', style: TextStyle(
          color: TechColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
        const SizedBox(height: 8),
        TextField(
          controller: _nameController,
          style: const TextStyle(color: TechColors.textPrimary),
          decoration: const InputDecoration(labelText: 'Full Name',
            prefixIcon: Icon(Icons.person_outline, color: TechColors.textMuted, size: 18)),
        ),
        const SizedBox(height: 10),
        if (_selectedSegment.contains(0))
          TextField(
            controller: _addressController,
            style: const TextStyle(color: TechColors.textPrimary),
            decoration: const InputDecoration(labelText: 'Delivery Address',
              prefixIcon: Icon(Icons.location_on_outlined, color: TechColors.textMuted, size: 18)),
          ),
      ],
    );
  }

  Widget _buildDateTimePickers() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today_outlined, size: 14),
            label: Text(_formatDate(_selectedDate), style: const TextStyle(fontSize: 12)),
            onPressed: _pickDate,
            style: OutlinedButton.styleFrom(
              foregroundColor: TechColors.textSecondary,
              side: const BorderSide(color: TechColors.border),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton.icon(
            icon: const Icon(Icons.access_time_outlined, size: 14),
            label: Text(_formatTime(_selectedTime), style: const TextStyle(fontSize: 12)),
            onPressed: _pickTime,
            style: OutlinedButton.styleFrom(
              foregroundColor: TechColors.textSecondary,
              side: const BorderSide(color: TechColors.border),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    if (widget.cartManager.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Icon(Icons.shopping_cart_outlined, color: TechColors.textMuted, size: 48),
              SizedBox(height: 12),
              Text('Your cart is empty', style: TextStyle(color: TechColors.textMuted)),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Order Summary', style: TextStyle(
          color: TechColors.textSecondary, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
        const SizedBox(height: 8),
        ...widget.cartManager.items.asMap().entries.map((entry) {
          final item = entry.value;
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16),
              child: const Icon(Icons.delete_outline, color: Colors.redAccent),
            ),
            onDismissed: (_) {
              setState(() => widget.cartManager.removeItem(item.id));
              widget.didUpdate();
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: TechColors.surfaceHigh,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: TechColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: TechColors.accent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('x${item.quantity}',
                      style: const TextStyle(color: TechColors.accent, fontSize: 11, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(item.name, style: const TextStyle(
                    color: TechColors.textPrimary, fontSize: 13, fontWeight: FontWeight.w500))),
                  Text('\$${item.totalCost.toStringAsFixed(2)}',
                    style: const TextStyle(color: TechColors.accent, fontWeight: FontWeight.w700, fontSize: 13)),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: TechColors.border)),
      ),
      child: ElevatedButton(
        onPressed: widget.cartManager.isEmpty ? null : _submitOrder,
        style: ElevatedButton.styleFrom(
          backgroundColor: TechColors.accent,
          foregroundColor: TechColors.background,
          disabledBackgroundColor: TechColors.border,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          widget.cartManager.isEmpty
              ? 'Add items to order'
              : 'Place Order  •  \$${widget.cartManager.totalCost.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  void _submitOrder() {
    final order = Order(
      selectedSegment: _selectedSegment,
      selectedTime: _selectedTime,
      selectedDate: _selectedDate,
      contactName: _nameController.text,
      address: _addressController.text,
      items: List.from(widget.cartManager.items),
    );
    widget.cartManager.resetCart();
    widget.onSubmit(order);
  }
}
