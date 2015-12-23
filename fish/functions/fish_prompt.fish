function fish_prompt
  set -l last_status $status

  # the time
  set_color black --background green
  echo -n (date +" %I:%M %p ")
  set_color --background normal
  echo -n ' '

  # the path
  set_color --background 1E90FF
  echo -n " "(pwd | sed s:$HOME:~:)" "
  set_color --background normal
  echo -n ' '

  # the git shell
  if git branch ^&- >&-
    set_color green --background 1E90FF
    echo -n (git branch --no-color ^ /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /')
    set_color --background normal
  end

  # the prompt depends on the last status
  if [ $last_status = 0 ]
    # echo -n \n"🐠 "
    echo -n \n"⚡️ "
  else
    # echo -n \n"🍣 " # sushi
    echo -n \n"💩 " # sushi
  end
  set_color --background normal
  echo -n ' '

end

function fish_right_prompt
  # the user
  set_color 1E90FF
  echo "$USER "

  # the date
  set_color blue
  date "+%m/%d/%y"
end
