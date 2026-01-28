import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'supabase.dart';

class ImageUploadService {
  static final ImageUploadService _instance = ImageUploadService._internal();
  ImageUploadService._internal();
  static ImageUploadService get instance => _instance;
  Future<String?> uploadImage({
    required Uint8List image,
    required BuildContext context,
    String? bucket,
    String? oldImageUrl,
  }) async {
    if (image.isEmpty) {
      return null;
    }

    try {
      // Delete old image
      if (oldImageUrl != null && oldImageUrl.isNotEmpty) {
        await SupabaseService.instance.deleteImage(oldImageUrl, bucket: bucket);
      }

      final imageUrl = await SupabaseService.instance.uploadImage(
        file: image,
        bucket: bucket,
      );
      return imageUrl;
    } catch (e) {
      if (!context.mounted) return null;

      // showSnackBar(message: 'Error uploading image: $e');
      return null;
    } 
  }
}
