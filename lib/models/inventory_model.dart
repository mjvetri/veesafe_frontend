import 'package:flutter/material.dart';

class InventoryItemModel {
  final IconData icon;
  final String label;
  final String? badge;

  const InventoryItemModel({
    required this.icon,
    required this.label,
    this.badge,
  });
}

final List<InventoryItemModel> inventoryItems = [
  const InventoryItemModel(icon: Icons.inventory_2_rounded,           label: 'Manage Inventory',           badge: '13'),
  const InventoryItemModel(icon: Icons.local_shipping_rounded,        label: 'Manage FBA Shipments'),
  const InventoryItemModel(icon: Icons.remove_shopping_cart_rounded,  label: 'Manage FBA Removals'),
  const InventoryItemModel(icon: Icons.language_rounded,              label: 'Sell Globally'),
  const InventoryItemModel(icon: Icons.calculate_rounded,             label: 'Revenue Calculator'),
  const InventoryItemModel(icon: Icons.recommend_rounded,             label: 'Channel Recommendations'),
];
