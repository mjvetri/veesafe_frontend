import 'package:flutter/material.dart';

class FilterRow extends StatefulWidget {
  const FilterRow({super.key});

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  String selected = 'All';
  final List<String> filters = ['All', 'Devices', 'Equipments'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Buy Again',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF222222),
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFCCCCCC)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Row(
            children: [
              Icon(Icons.filter_list, size: 16, color: Color(0xFF444444)),
              SizedBox(width: 4),
              Text(
                'Filter By',
                style: TextStyle(fontSize: 12, color: Color(0xFF444444)),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        ...filters.map((f) => GestureDetector(
              onTap: () => setState(() => selected = f),
              child: Container(
                margin: const EdgeInsets.only(left: 6),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: selected == f
                      ? const Color(0xFF1A2D6B)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: selected == f
                        ? const Color(0xFF1A2D6B)
                        : const Color(0xFFCCCCCC),
                  ),
                ),
                child: Text(
                  f,
                  style: TextStyle(
                    fontSize: 12,
                    color: selected == f
                        ? Colors.white
                        : const Color(0xFF444444),
                    fontWeight: selected == f
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
