class MainController < ApplicationController
  
  def index
      uri = URI("http://www.naver.com/")
      html_doc = Nokogiri::HTML(Net::HTTP.get(uri))
      @rank_arr = html_doc.css("#realrank li//a").inner_html.gsub(/<span.+?<\/span>/,'/').split("///")
      
      # 시사태그
      @sisa_sub = ["[북한 서부전선 포격]5년만의 남북 포격전","[아베 담화] 과거형 '사죄'…한일관계 '급진전' 힘들…",
                  "[한명숙 대법원 판결] 기소 5년 만에 징역 2년 확정","[중국 톈진 폭발사고] 시안화나트륨 대량유출 확인",
                  "[광복절 특별사면] 최태원 등 6천527명 특사"]
      @sisa_pic = ["http://imgnews.naver.net/image/022/2015/08/21/20150821000937_0_99_20150824215604.jpg?type=w540",
                    "http://imgnews.naver.net/image/003/2015/08/14/NISI20150814_0005780556_web_99_20150814205704.jpg?type=w540",
                    "http://imgnews.naver.net/image/001/2015/08/20/PYH2015082011960001300_P2_99_20150820224405.jpg?type=w540",
                    "http://imgnews.naver.net/image/001/2015/08/20/AKR20150820062051083_01_i_99_20150820175312.jpg?type=w540",
                    "http://imgnews.naver.net/image/001/2015/08/13/PYH2015081303620001300_P2_99_20150813164512.jpg?type=w540"]
                    
      #연예
      @girl_sub = ["최고의 걸그룹은??", "최고의 솔로가수는??", "수지 vs 효성", "AOA vs EXID", "솔지 vs 하니"]
      @girl_pic = ["http://pds.joins.com/news/component/osen_new/201305/12/201305121759770343_518f5a9c96dbe.jpg",
                    "https://i.ytimg.com/vi/1SiLiFrZJ74/maxresdefault.jpg", "http://i.ytimg.com/vi/4jsJlyXT95w/maxresdefault.jpg",
                    "http://www.billboard.co.kr/wp-content/uploads/2015/07/37.png","http://fimg2.pann.com/new/download.jsp?FileID=30261949"]
      
  end
  
  def testslider
  end
  
  def post_list
  end
  
  def post_content
    a = params[:id]
    if a == 'accept'
      @index = 0
    elsif a == 'reject'
      @index = 1
    end
  end
  
end