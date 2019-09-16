#http://shouce.jb51.net/shell/aliases.html


# alias ll='ls -l'
#直接在命令行里使用 alias，仅仅可以应用于当前的会话，为了下次启动时不需要重新再写，我们应该把它写到 ~/.bashrc 里
# 使用 vim 打开 .bashrc

# vim ~/.bashrc
# 直接在里面添加你需要的 alias 命令，比如 alias hi='echo hi'
# 保存，完成~

shopt -s expand_aliases
# 必须设置这个选项，否则脚本不会扩展别名功能.


# 首先, 来点有趣的.
alias Jesse_James='echo "\"Alias Jesse James\" was a 1959 comedy starring Bob Hope."'
Jesse_James

echo; echo; echo;

alias ll="ls -l"
# 可以使用单引号(')或双引号(")来定义一个别名.

echo "Trying aliased \"ll\":"
ll /usr/X11R6/bin/mk*   #* 别名工作了.

echo