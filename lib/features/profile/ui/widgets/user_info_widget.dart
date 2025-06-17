import 'package:flutter/material.dart';

class ProfileInfoField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isEditing;
  final IconData icon;
  final String? Function(String?)? validator;

  const ProfileInfoField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.isEditing,
    required this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // الخاصية الأهم: تجعل الحقل للقراءة فقط إذا لم نكن في وضع التعديل
      readOnly: !isEditing,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon, color: Colors.grey.shade600),
        filled: true,
        // تغيير لون الخلفية حسب حالة التعديل
        fillColor: isEditing ? Colors.white : Colors.grey.shade100,
        // إظهار الحدود فقط في حالة التعديل
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isEditing ? Colors.grey.shade400 : Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isEditing ? Colors.grey.shade400 : Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}