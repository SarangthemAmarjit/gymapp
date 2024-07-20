function initAES(method, text, encKey) {
    if (method === 'encrypt') {
      // Your AES encryption logic here
      // For example purposes, returning a static string
      return `Encrypted(${text})With(${encKey})`;
    } else {
      throw 'Unsupported AES method';
    }
  }