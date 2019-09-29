#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�"�g]move.sh �RKo�@>��b�ͱ���V�R{���P����W�K���P�D@pj�R!�"Ѣ>AJ"@M\~��vN��q�(�����1�39��4�L,-<4�M�5]aȩ� 8�4�&�J�6��Pb"��J?Z*J�e���۳|)I]"�c��r���R1���*�J��7�67�-Sݡ���@�S������E;��D�Rh��矞W^t�}ٟ��|��i��Z�F���A<e6�2�/$�����q㷢�A0 ��a��-y�DG=�;Ȱ+HY���OB�;��$�N�ۡw�Z|�}x��7f)������6>m��w/�;�^���>��������7���|�{����L$'~;�N՟hD��U��Vt��x����q���� ��g3���4L��`%�Q��0���k֑T��
��LS7A�H�7�SGe��9����l[��:쿃�������I����*�`��  