public class YoutubeController {
    
    public String body {set;get;}
    public List<MyOwnDataType> dataList {set;get;}
    public String searchEntry {set;get;}
    
    public void search(){
        dataList = new List<MyOwnDataType>();
        String localSearchText = searchEntry.replaceAll(' ', '+');
        //make the callout
        
        //1. Instantiate a new http object
        Http h = new Http();
        
        //2.Frame the HttpRequest
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://youtube.googleapis.com/youtube/v3/search?part=snippet&q='+ localSearchText +'&key=AIzaSyBMUThj0et6y85-48y979Wvm6Dgw9Ugl0Q');
        req.setMethod('GET');
        req.setHeader('content-type', 'application/json');
        
        //3. Handle the HttpResponse
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        body = res.getBody();
        
        fromJSON d = (fromJSON)JSON.deserialize(body, fromJSON.class);
        
        //Need 5 records to display on the VF Page
        //Custom records with each record having Title, Description, Image Url, etc
        for(Integer i = 0 ; i < d.items.size() ; i++) {
            System.debug('1.'+d.items[i].snippet.title);
            System.debug('2.'+d.items[i].snippet.description);
            System.debug('3.'+d.items[i].snippet.publishedAt);
            System.debug('4.'+d.items[i].snippet.thumbnails.medium.url);
            
            //Add to the List
            dataList.add(new MyOwnDataType(d.items[i].snippet.title, d.items[i].snippet.description, d.items[i].snippet.publishedAt, d.items[i].snippet.thumbnails.medium.url));
        }
    }
    
    public class MyOwnDataType{
        public String title{set;get;}
        public String description{set;get;}
        public String publishedAt{set;get;}
        public String url{set;get;}
        
        public MyOwnDataType(String newTitle, String newDescription, String newPublishedAt, String newUrl) {
            this.title = newTitle;
            this.description = newDescription;
            this.publishedAt = newPublishedAt;
            this.url = newUrl;
        }
    }
    
    public class fromJSON{
	public String kind;	//youtube#searchListResponse
	public String etag;	//WV6Gd1a6Xao-bZgwFQcWMLEQLJo
	public String nextPageToken;	//CAUQAA
	public String regionCode;	//US
	public cls_pageInfo pageInfo;
	public cls_items[] items;
	}
    class cls_pageInfo {
		public Integer totalResults;	//925530
		public Integer resultsPerPage;	//5
	}
	class cls_items {
		public String kind;	//youtube#searchResult
		public String etag;	//DDjD2XbqAJ-mkJNCCpAgkL2qDIM
		public cls_id id;
		public cls_snippet snippet;
	}
	class cls_id {
		public String kind;	//youtube#channel
		public String channelId;	//UCUpquzY878NEaZm5bc7m2sQ
	}
	class cls_snippet {
		public String publishedAt;	//2006-08-03T21:52:39Z
		public String channelId;	//UCUpquzY878NEaZm5bc7m2sQ
		public String title;	//Salesforce
		public String description;	//Salesforce is a customer relationship management solution that brings companies and customers together. It's one integrated CRM platform that gives all your ...
		public cls_thumbnails thumbnails;
		public String channelTitle;	//Salesforce
		public String liveBroadcastContent;	//none
		public String publishTime;	//2006-08-03T21:52:39Z
	}
	class cls_thumbnails {
		public cls_default default_x;
		public cls_medium medium;
		public cls_high high;
	}
	class cls_default {
		public String url;	//https://yt3.ggpht.com/ZIPvInnj50dYnGYvkanm_IYcoYaofSY47e_4iah-EoCduSdhxYOC_-TCatm9XR3HAp1HJeomAa0=s88-c-k-c0xffffffff-no-rj-mo
	}
	class cls_medium {
		public String url;	//https://yt3.ggpht.com/ZIPvInnj50dYnGYvkanm_IYcoYaofSY47e_4iah-EoCduSdhxYOC_-TCatm9XR3HAp1HJeomAa0=s240-c-k-c0xffffffff-no-rj-mo
	}
	class cls_high {
		public String url;	//https://yt3.ggpht.com/ZIPvInnj50dYnGYvkanm_IYcoYaofSY47e_4iah-EoCduSdhxYOC_-TCatm9XR3HAp1HJeomAa0=s800-c-k-c0xffffffff-no-rj-mo
	}


}