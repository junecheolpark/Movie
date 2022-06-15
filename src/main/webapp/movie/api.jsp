<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화목록</title>
</head>
<body>
	<form action="/lib.movie" method="post">
	    <div id="a">
	        <input type="submit" value="db에 저장">
	        <input type="hidden" name="command" vlaue="listdb">
	    </div>
    </form>
    <script> //javaScirpt

        //index.json

        var key = "?key=0b5614361bd8f2d735ce0a51f7929512" // key 앞에 <?key=>를 붙여야함 : prameter
        var itemPerPage = "&itemPerPage=100" //100개를 가져올것이라서
        const url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json"
            + key
            + itemPerPage
        var item_int = 100

        var title = document.getElementById('a') //html에서 id a에 해당하는 것

        /**/
        fetch(url)
            .then(response => response.json())
            .then(function (msg) { //아래부터는 html로 가져오기 위한 코드
                short_url1 = msg.movieListResult.movieList;
                 console.log(short_url1);
                for (var i = 0; i < item_int; i++) {
                    // create element (input)
                    var input1 = document.createElement('input');
                    // set attribute (input)
                   
                    var div = document.createElement('div');
                    // var low_div = document.createElement('div')
                    // var title_div = document.createElement('div')
                    var br = document.createElement('br');

                    var mc = document.createElement('p');//
                    mc.id = 'movieCd'
                    var mn = document.createElement('p');//
                    mn.id = 'movieNm'
                    var mne = document.createElement('p');//
                    mne.id = 'movieNmEn'
                    var pp = document.createElement('p');//
                    pp.id = 'prdtYear'
                    //var op = document.createElement('p');//
                    //pp.id = 'openDt'
                    var np = document.createElement('p');//
                    np.id = 'nationAlt'
                    var gp = document.createElement('p');
                    gp.id = 'genreAlt'
                    var dp = document.createElement('p');
                    dp.id = 'directors'

                    // title_div.id = 'title_div'
                    // low_div.id = 'low_div'
                    div.id = 'movies'
                    short_url = msg.movieListResult.movieList[i]
                    console.log(short_url.directors[0]);
                    // div.appendChild(title_div)
                    // div.appendChild(low_div)
                    title.appendChild(div);

                    var movieCd = document.createTextNode('영화코드 : ' + short_url.movieCd);//
                    var movieNm = document.createTextNode('영화(한글)제목 : ' + short_url.movieNm);//
                    var movieNmEn = document.createTextNode('영화(영어)제목 : ' + short_url.movieNmEn);//
                    var prdtYear = document.createTextNode('제작년도 : ' + short_url.prdtYear);//
                    //var openDt = document.createTextNode('개봉일 : ' + short_url.openDt);//
                    var nationAlt = document.createTextNode('국가 : ' + short_url.nationAlt);//
                    var genreAlt = document.createTextNode('영화장르 : ' + short_url.genreAlt);//
                    var directors = document.createTextNode('감 독 : ' + short_url.directors[0]);//

                    input1.setAttribute("type", "hidden");
                    input1.setAttribute("name", "lib");
                    input1.setAttribute("value", short_url.movieCd +"/"+ short_url.movieNm+"/"+ short_url.movieNmEn +"/"+short_url.prdtYear +"/"+ short_url.nationAlt+"/"+ short_url.genreAlt+"/"+ short_url.directors[0]);
                    


                    mc.appendChild(movieCd);//
                    mn.appendChild(movieNm);//
                    mne.appendChild(movieNmEn);//
                    pp.appendChild(prdtYear);//
                    //op.appendChild(openDt);//
                    np.appendChild(nationAlt);//
                    gp.appendChild(genreAlt);//
                    dp.appendChild(directors);//


                    div.appendChild(mc);//
                    div.appendChild(mn);//
                    div.appendChild(mne);//

                    div.appendChild(pp);//
                    //div.appendChild(op);//
                    div.appendChild(np);//
                    div.appendChild(gp);//
                    div.appendChild(dp);//

                    div.appendChild(br);
                    div.appendChild(input1);
                   

                }

            });








    </script>