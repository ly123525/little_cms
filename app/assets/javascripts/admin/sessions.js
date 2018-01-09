(function($){
    $(function(){
        var rucaptcha_verflity =false;
        $('.rucaptcha-image').on('click', function(){
            $(this).attr('src',"/rucaptcha/?t="+Math.random());
        });
        $('.js_rucaptcha_input').on('blur',function(){
            var rucaptcha_val= $(this).val();
            var _this = $(this);
            if($(this).val().length>0){
                $.ajax({
                    url: '/admin/verify_rucaptcha',
                    dataType: 'json',
                    type: 'post',
                    data: {
                        _rucaptcha: rucaptcha_val
                    },
                    success: function(data){
                        if(data.error){
                            _this.next().css('display','block').text(data.data);
                            $('.rucaptcha-image').click();
                            // $('.js_btn').prop('disabled',true);
                            rucaptcha_verflity = false;
                        }else{
                            _this.next().css('display','none');
                            // $('.js_btn').prop('disabled',false);
                            rucaptcha_verflity= true;
                        }

                    }
                });
            }else{
                $(this).next().css('display','block').text('验证码不能为空！');
            }

        });
        $('.js_btn').on('click', function(e){
            e.preventDefault();
            var email = $('#email').val();
            var password = $('#password').val();
            if(email.length<=0){
                $('.email_error_field').css('display','block').text('邮箱不能为空！');
                $('.rucaptcha-image').click();
                return false;
            }
            if(password.length<=0){
                $('.password_error_field').css('display','block').text('密码不能为空！');
                $('.rucaptcha-image').click();
                return false;
            }
            if(!rucaptcha_verflity){
                $('.rucaptcha_error_field').css('display','block').text('验证码不正确！');
                $('.rucaptcha-image').click();
                return false;
            }
            $.ajax({
                url: '/admin/login',
                type:'post',
                dataType: 'json',
                data: {
                    email: email,
                    password: password
                },
                success: function(data){
                    if(data.error){
                        $('.email_error_field').css('display','block').text(data.data.message);
                        $('.rucaptcha-image').click();
                    }else{
                        window.location.href= data.data.url;
                    }
                }
            });
        })
    });
})(jQuery);