function git::is_stashed
  command git rev-parse --verify --quiet refs/stash >/dev/null
end

function git::get_ahead_count
  echo (command git log 2> /dev/null | grep '^commit' | wc -l | tr -d " ")
end

function git::branch_name
  command git symbolic-ref --short HEAD
end

function git::is_touched
  test -n (echo (command git status --porcelain))
end

function fish_right_prompt
  set -l code $status
  set -l yellow_o (set_color -o fa0)
  set -l purple_o (set_color -o 36f)
  set -l purple (set_color 36f)
  set -l pink_o (set_color -o f06)
  set -l pink (set_color f06)
  set -l grey (set_color 666)
  set -l none (set_color normal)
  test $code -ne 0; and echo "$none$grey($pink_o$code$none$grey)$none "

  if test -n "$SSH_CONNECTION"
     printf "$pink_o:$grey$HOSTNAME$none "
   end

  if git rev-parse 2> /dev/null
    git::is_stashed; and echo $pink"^"$none
    printf $purple_o"["(begin
      if git::is_touched
        echo $pink"*"$none
      else
        echo ""
      end
    end)$yellow_o(git::branch_name)$purple(begin
      set -l count (git::get_ahead_count)
        if test $count -eq 0
          echo ""
        else
          echo $none$pink"+"$yellow_o$count
        end
    end)$purple_o"]"$none
  end
end
