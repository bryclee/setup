printf "        "
for b in 0 1 2 3 4 5 6 7; do printf "  4${b}m"; done
for b in 0 1 2 3 4 5 6 7; do printf " 10${b}m"; done
echo
for f in "" 30 31 32 33 34 35 36 37 90 91 92 93 94 95 96 97; do
  printf "%3sm " "${f}"
  printf "\033[%sm%s\033[0m" "$f" "gYw "
  for bb in 4 10; do
    for b in 0 1 2 3 4 5 6 7; do
      printf "\033[%s;%sm%s\033[0m" "$f" "$bb$b" " gYw "
    done
  done
  echo
done
