#!/usr/bin/env python3
# Todo;
# use argparse for arguments? (--help + make file out folder_out optional? (creates a mp3 folder))

import ffmpeg
import glob
import sys
import os
from pathlib import Path

folder_in = sys.argv[1]
folder_out = sys.argv[2]
if len(sys.argv) >= 4:
  ext = '.' + sys.argv[3]
else:
  ext = '.wav'


print(os.path.join(folder_in, '*' + ext))
filenames = glob.glob(os.path.join(folder_in, '*' + ext))

if len(filenames) > 0:
  try:
    os.makedirs(folder_out)
  except OSError as error:
    print(error)
  for file in filenames:
    file_out = folder_out + '/' + Path(file).stem + '.mp3'   # Path().stem removes file extension.
    (
      ffmpeg
      .input(file)
      .output(file_out, audio_bitrate='320k')
      .run()
    )
else:
  print('Error: No files to convert')
