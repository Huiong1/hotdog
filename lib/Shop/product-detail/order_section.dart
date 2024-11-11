import 'package:flutter/material.dart';
import '../ProductClass.dart'; // ProductClass 모델을 import 합니다.

class OrderSection extends StatefulWidget {
  final ProductClass product; // 상품 정보를 받을 변수

  const OrderSection({Key? key, required this.product}) : super(key: key);

  @override
  _OrderSectionState createState() => _OrderSectionState();
}

class _OrderSectionState extends State<OrderSection> {
  int _itemCount = 0; // 아이템 수를 저장하는 상태 변수

  void _incrementCount() {
    setState(() {
      _itemCount++; // + 버튼 클릭 시 아이템 수 증가
    });
  }

  void _decrementCount() {
    if (_itemCount > 0) {
      setState(() {
        _itemCount--; // - 버튼 클릭 시 아이템 수 감소
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final int totalPrice = _itemCount * widget.product.price.toInt();

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Color(0xFFAAD5D1)),
                  onPressed: _decrementCount,
                ),
                const SizedBox(width: 14),
                Text(
                  '$_itemCount', // 현재 아이템 수 표시
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFDCDCE4),
                  ),
                ),
                const SizedBox(width: 14),
                IconButton(
                  icon: Icon(Icons.add, color: Color(0xFFAAD5D1)),
                  onPressed: _incrementCount,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFAAD5D1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Add to order',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$totalPrice Won', // 총 가격 표시
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
