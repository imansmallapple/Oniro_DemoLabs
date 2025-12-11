import file from '@ohos.file.fs'; // Used for reading regular files
import { util } from '@kit.ArkTS';

class ImageUtil {

  /**
   * Convert an image file to Base64 string.
   * @param filePath - Absolute file path of the image
   * @returns Base64 encoded string
   */
  static async convertToBase64(filePath: string): Promise<string> {
    try {
      // Read file content as Uint8Array
      const uint8Array = await ImageUtil.readFileAsUint8Array(filePath);

      // Create Base64Helper instance
      const base64 = new util.Base64Helper();

      // Convert Uint8Array into Base64 string
      const base64Str = base64.encodeToStringSync(uint8Array);
      console.info('Base64 Encoded String:', base64Str);

      return base64Str;
    } catch (err) {
      console.error('Error converting to Base64:', err);
      return String(err);
    }
  }

  /**
   * Read file content as Uint8Array.
   * @param filePath - Absolute path of the image file
   * @returns Uint8Array buffer
   */
  static async readFileAsUint8Array(filePath: string): Promise<Uint8Array> {
    try {
      // Open file
      const fd = file.openSync(filePath, file.OpenMode.READ_ONLY);

      // Get file size
      const stats = file.statSync(filePath);
      const buffer = new ArrayBuffer(stats.size);

      // Create Uint8Array and read file content
      const uint8Array = new Uint8Array(buffer);
      const bytesRead = file.readSync(fd.fd, uint8Array as ArrayBuffer, {
        offset: 0,
        length: stats.size
      });

      // Close the file
      file.closeSync(fd);

      console.info('File successfully read as Uint8Array, bytesRead:', bytesRead);
      return uint8Array;
    } catch (err) {
      console.error('Error reading file:', err);
      return Promise.reject(err);
    }
  }
}

export { ImageUtil };
