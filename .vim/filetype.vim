" Set permissions for bash scripts
au BufWritePost *.sh silent execute "!chmod a+x <afile>"
" Automatically give executable permission to scripts starting with a shebang (#!)
au BufWritePost * if getline(1) =~ "^#!.+" | silent execute "!chmod a+x <afile>" | endif
