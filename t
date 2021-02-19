
[1mFrom:[0m /home/zacharyflynn06/Flatiron/projects/the-salted-hash/app/controllers/post_controller.rb:70 self.PATCH /posts/:id:

    [1;34m65[0m:     patch [31m[1;31m'[0m[31m/posts/:id[1;31m'[0m[31m[0m [32mdo[0m
    [1;34m66[0m:         redirect_if_not_logged_in
    [1;34m67[0m:         [1;34m#redirect_error_if_not_authorized[0m
    [1;34m68[0m:         binding.pry
    [1;34m69[0m:         post = [1;34;4mPost[0m.find(params[[33m:id[0m])
 => [1;34m70[0m:         binding.pry
    [1;34m71[0m:         post.update(
    [1;34m72[0m:             [35mtitle[0m: params[[33m:post[0m][[33m:title[0m], 
    [1;34m73[0m:             [35mdescription[0m: params[[33m:post[0m][[33m:description[0m],
    [1;34m74[0m:             [35muser_id[0m: session[[33m:user_id[0m],
    [1;34m75[0m:             [35mavatar[0m: params[[33m:post[0m][[33m:photo[0m]

