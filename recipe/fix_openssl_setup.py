# Perform the renaming of these things

with open('setup.py', 'rb') as fo:
  content = fo.read()
  content = content.replace(b'ssleay32', b'libssl')
  content = content.replace(b'libeay32', b'libcrypto')

with open('setup.py', 'wb') as fo:
  fo.write(content)
