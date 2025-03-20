# Collection of ctf tools
These are resources and other tools I have found to be very useful when playing CTFs.

#### How to use sagemath:
source ~/anaconda3/bin/activate
conda activate sage
sage -python script.py

#### How to use rustpad
rustpad web --oracle http://34.123.210.162:5003/padding_oracle -t 1 -H 'Content-Type: application/json' -d '{"ciphertext": "CTEXT"}' -D 2236423f530e397e1bc44407104f613d79396634432cd44fda0d1b10a5d2d225de8d3ef709e7d20a1407ce2577452c25 --block-size 16 -c -e hex -o log.txt -v -v -v --no-cache -T 70
