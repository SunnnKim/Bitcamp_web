$(".login-form").validate({
  rules: {
	 id: {
		  required: true,
		  minlength: 3
	 },     
    name: {
    	required: true,
    	minlength: 2
    },     
    email: {
      required: true,
      email:true
    },
    password: {
      required: true,
      minlength: 4
    },
    cpassword: {
      required: true,
      minlength: 4,
      equalTo: "#password"
    }
  },
  //For custom messages
  messages: {
    name:{
      required: "이름을 입력하세요!",
      minlength: "이름은 2자 이상 입력하세요"
    },
    id:{
    	required: "아이디를 입력하세요!",
    	minlength: "아이디는 3자 이상 입력하세요"
    },
  	email:{
		  required: "이메일을 입력하세요!",
		  email: "example : abc@def.com"
  	},
    password:{
    	required: "비밀번호를 입력하세요!",
    	minlength: "비밀번호는 4자이상 입력하세요!"
    },
    cpassword: {
        required: "비밀번호를 한번 더 입력하세요!",
        minlength: "비밀번호를 한번 더 입력하세요!",
        equalTo: "같은 비밀번호를 입력하세요"
      }
  },
  errorElement : 'div',
  errorPlacement: function(error, element) {
    var placement = $(element).data('error');
    if (placement) {
      $(placement).append(error)
    } else {
      error.insertAfter(element);
    }
  }
});



