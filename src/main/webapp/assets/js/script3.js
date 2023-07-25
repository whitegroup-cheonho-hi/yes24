$(document).ready(function(){

    //스크롤 했을 때 헤더에 클래스값 부여
    $(window).on('scroll',function(){
        if($(window).scrollTop()){
            $('header').addClass('active');
        }else{
            $('header').removeClass('active');
        }
    });

    //모바일 햄버거버튼 메뉴 (아코디언 메뉴)
    $('header.mo .middle_menu > li').click(function() {
      if ( $(this).hasClass('active') ) {
          $(this).find(' > ul').stop().slideUp(300);
          $(this).removeClass('active');
      }
      else {
          $(this).find(' > ul').stop().slideDown(300);
          $(this).addClass('active');
      }
    });
    //모바일 햄버거버튼 메뉴 창닫고 다시 클릭 했을 때 아코디언 메뉴 초기화
    $('header.mo #icon + label').click(function() {
      if($('header.mo #icon').is(":checked")==false){
        $('header.mo .middle_menu > li').removeClass('active').find('ul').hide();
        $('html').css('overflow', 'hidden');
      }else{
        $('html').css('overflow', 'scroll');
      }
    });

    //검색
    $('header .search').click(function() {
      $('.search_popup').show();
      $('body').addClass('no-scroll');
    });
    $('.search_close').click(function() {
      $('.search_popup').hide();
      $('.search_popup #search').val(''); //검색창 닫았을 때 검색어 초기화
      $('body').removeClass('no-scroll');
    });


    //메인 롤링배너(kv)
    var swiper = new Swiper(".swiper", {
        effect : 'fade', // 페이드 효과 사용
        spaceBetween: 30,    // 슬라이드 사이 여백
        slidesPerView : 'auto', // 한 슬라이드에 보여줄 갯수
        centeredSlides: true,    //센터모드
        autoplay: {     //자동슬라이드 (false-비활성화)
          delay: 2500, // 시간 설정
          disableOnInteraction: false, // false-스와이프 후 자동 재생
        },
        loop : true,   // 슬라이드 반복 여부
        loopAdditionalSlides : 1, // 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드가 보여지지 않는 현상 수정
        pagination: { // 호출(pager) 여부
          el: ".swiper-pagination", //버튼을 담을 태그 설정
          clickable: true, // 버튼 클릭 여부
        },
        navigation: {   // 버튼
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
    });
    
    
    //베스트셀러 롤링
    $('#best_seller_div').slick({
      slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
      infinite : true,     //무한 반복 옵션     
      slidesToShow : 4,        // 한 화면에 보여질 컨텐츠 개수
      slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
      speed : 100,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
      arrows : true,         // 옆으로 이동하는 화살표 표시 여부
      dots : false,         // 스크롤바 아래 점으로 페이지네이션 여부
      autoplay : true,            // 자동 스크롤 사용 여부
      autoplaySpeed : 3000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
      vertical : false,        // 세로 방향 슬라이드 옵션
      prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        // 이전 화살표 모양 설정
      nextArrow : "<button type='button' class='slick-next'>Next</button>",        // 다음 화살표 모양 설정
      dotsClass : "slick-dots",     //아래 나오는 페이지네이션(점) css class 지정
      draggable : true,     //드래그 가능 여부 
      
      responsive: [ // 반응형 웹 구현 옵션
          {  
              breakpoint: 960, //화면 사이즈 960px
              settings: {
                  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                  slidesToShow:3 
              } 
          },
          { 
              breakpoint: 768, //화면 사이즈 768px
              settings: {    
                  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                  slidesToShow:2 
              } 
          }
      ]
    
    });
    
    
    
    //top버튼
    $( window ).scroll( function() {
      if ( $( this ).scrollTop() > 200 ) {
        $( '.top_btn' ).fadeIn();
      } else {
        $( '.top_btn' ).fadeOut();
      }
    } );
    $( '.top_btn' ).click( function() {
      $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
      return false;
    } );




    //장바구니페이지 수량 체크
    $('._count :button').on({
      'click' : function(e){
          e.preventDefault();
          var $count = $(this).parent('._count').find('.inp');
          var now = parseInt($count.val());
          var min = 1;
          var max = 999;
          var num = now;
          if($(this).hasClass('minus')){
              var type = 'm';
          }else{
              var type = 'p';
          }
          if(type=='m'){
              if(now>min){
                  num = now - 1;
              }
          }else{
              if(now<max){
                  num = now + 1;
              }
          }
          if(num != now){
              $count.val(num);
          }
      }
    });

    //pc 장바구니 페이지 체크박스
    $("#cbx_chkAll").click(function() {
      if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
      else $("input[name=chk]").prop("checked", false);
    });
    
    $("input[name=chk]").click(function() {
      var total = $("input[name=chk]").length;
      var checked = $("input[name=chk]:checked").length;
      
      if(total != checked) $("#cbx_chkAll").prop("checked", false);
      else $("#cbx_chkAll").prop("checked", true); 
    });

    //mo 장바구니 페이지 체크박스
    $("#cbx_chkAll_m").click(function() {
      if($("#cbx_chkAll_m").is(":checked")) $("input[name=chk_m]").prop("checked", true);
      else $("input[name=chk_m]").prop("checked", false);
    });
    
    $("input[name=chk_m]").click(function() {
      var total = $("input[name=chk_m]").length;
      var checked = $("input[name=chk_m]:checked").length;
      
      if(total != checked) $("#cbx_chkAll_m").prop("checked", false);
      else $("#cbx_chkAll_m").prop("checked", true); 
    });
    
    
    
    
    
    //문의글 아코디언
    $('#inquiry .qna_wrap .tit').click(function() {
	  if ( $(this).parent().hasClass('active') ) {
          $(this).parent().siblings('.text_wrap').stop().slideUp(300);
          $(this).parent().removeClass('active');
      }
      else {
          $(this).parent().siblings('.text_wrap').stop().slideDown(300);
          $(this).parent().addClass('active');
      }
    });
    

    //문의 글 쓰기
    $('#inquiry .inquiry_ > .btn_wrap > a').click(function() {
      $('#inquiry_popup').show();
      $('body').addClass('no-scroll');
    });
    $('#inquiry .inquiry_popup .btn_wrap .shopping_btn').click(function() {
      $('#inquiry_popup').hide();
      $('#inquiry_popup').find('*').val(''); //문의 글쓰기 창 닫았을 때 문의글 초기화
      $('body').removeClass('no-scroll');
    });   
    $('#inquiry .inquiry_popup .inquiry_close').click(function() {
      $('#inquiry_popup').hide();
      $('#inquiry_popup').find('*').val(''); //문의 글쓰기 창 닫았을 때 문의글 초기화
      $('body').removeClass('no-scroll');
    });  
    $('#inquiry_cont').keyup(function (e) {
      let content = $(this).val();        
        // 글자수 세기
        if (content.length == 0 || content == '') {
          $('.textCount').text('0자');
        } else {
          $('.textCount').text(content.length + '자');
        }
        
        // 글자수 제한
        if (content.length > 700) {
          // 700자 부터는 타이핑 되지 않도록
            $(this).val($(this).val().substring(0, 700));
            // 700자 넘으면 알림창 뜨도록
            alert('글자수는 700자까지 입력 가능합니다.');
        };
    });
    
    
    
    
    });
    
    