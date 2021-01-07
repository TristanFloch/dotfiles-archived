function fish_prompt
  test $status -ne 0;
    and set -l colors 600 900 c00
    or set -l colors 333 666 aaa

  set -l yellow_o (set_color -o fa0)
  set -l purple_o (set_color -o 36f)
  set -l purple (set_color 36f)
  set -l none (set_color normal)

  set -l pwd (prompt_pwd)
  set -l base (basename "$pwd")

  set -l expr "s|~|"$yellow_o^^$none"|g; \
               s|/|"$purple_o/$none"|g;  \
               s|"$base"|"$yellow_o$base$none"|g"

  echo -n (echo "$pwd" | sed -e $expr)$none

  for color in $colors
    echo -n (set_color -o $color)"❯"
  end

  echo -n " "
end
