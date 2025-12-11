/**
 * String Utilities for ArkTS
 */
import { util } from "@kit.ArkTS";

class StringUtil {
  /**
   * Checks if the provided string is null, undefined, or an empty string.
   *
   * @param str - The string to check
   * @returns True if the string is null, undefined, or empty; otherwise, false
   */
  static isNullOrEmpty(str: string | undefined | null): boolean {
    return !str || str.trim().length === 0;
  }

  /**
   * Checks if the provided string is not null, undefined, or empty.
   *
   * @param str - The string to check
   * @returns True if the string is not null, undefined, or empty; otherwise, false
   */
  static isNotNullOrEmpty(str: string | undefined | null): boolean {
    return !!str && str.trim().length > 0;
  }

  /**
   * Convert string to Uint8Array.
   * @param value - Input string
   * @returns Uint8Array encoded in UTF-8, or null if input is empty
   */
  string2Uint8Array1(value: string): Uint8Array {
    if (!value) {
      return null;
    }
    // Create a TextEncoder (UTF-8 only)
    let textEncoder = new util.TextEncoder();
    // Encode into UTF-8 byte stream
    return textEncoder.encodeInto(value)
  }

  /**
   * Convert string to Uint8Array using an existing Uint8Array destination buffer.
   * @param value - The source text to encode
   * @param dest - The Uint8Array buffer to store encoded bytes
   * @returns An object containing 'read' and 'written' values, or null if invalid
   */
  string2Uint8Array2(value: string, dest: Uint8Array) {
    if (!value) {
      return null;
    }
    if (!dest) {
      dest = new Uint8Array(value.length);
    }
    let textEncoder = new util.TextEncoder();
    // read:   number of characters read from the source string.
    // written: number of UTF-8 bytes written to the destination array.
    textEncoder.encodeIntoUint8Array(value, dest)
    // let result = textEncoder.encodeIntoUint8Array(value, dest)
    // result.read
    // result.written
  }

  /**
   * Convert Uint8Array to String.
   * @param input - Uint8Array input
   * @returns Decoded UTF-8 string
   */
  uint8Array2String(input: Uint8Array) {
    let textDecoder = util.TextDecoder.create("utf-8", { ignoreBOM: true })
    return textDecoder.decodeToString(input, { stream: false });
  }

  /**
   * Convert ArrayBuffer to String.
   * @param input - ArrayBuffer input
   * @returns UTF-8 decoded string
   */
  arrayBuffer2String(input: ArrayBuffer) {
    return this.uint8Array2String(new Uint8Array(input))
  }
}

export { StringUtil }
