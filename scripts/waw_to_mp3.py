#!/usr/bin/env python3
# Todo;
# Make the script take 2 inputs, 1 for folder with wav files,
# and 1 for foldet where the mp3 files go.

import ffmpeg
import glob
from pathlib import Path

filenames = glob.glob('*.wav')

for file in filenames:
  file_out = Path(file).stem + '.mp3'   # Path().stem removes file extension.
  (
      ffmpeg
      .input(file)
      .output(file_out, audio_bitrate='320k')
      .run()
  )
