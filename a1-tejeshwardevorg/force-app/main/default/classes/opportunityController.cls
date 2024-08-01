public with sharing class opportunityController {
    @auraenabled(cacheable=true)
    public static List<Opportunity> getOpportunities(String searchkey) {

        if(searchkey.isnumeric()) {
            integer searchConverted = integer.valueof(searchkey);
            return [SELECT Id, Name, AccountId, Account.Name, Type, StageName, Amount FROM Opportunity 
            WHERE Amount =: searchConverted LIMIT 20];
        }
        else {
            return [SELECT Id, Name, AccountId, Account.Name, Type, StageName, Amount FROM Opportunity 
            WHERE Name LIKE : '%' + searchkey + '%' 
            OR Account.Name LIKE : '%' + searchkey + '%'
            OR Type LIKE : '%' + searchkey + '%' 
            OR StageName LIKE : '%' + searchkey + '%' LIMIT 20];
        }
    }
    
    @AuraEnabled(cacheable=true)
    public static String getHttpRequest() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.github.com/repositories?since=1');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) 
        {
            // Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

            // List<Object> items = (List<Object>) results.get('items');

            // for(Object item : items) {
            //     Map<String, Object> childItems = (Map<String, Object>)item;
            //     System.debug('Received this :');
            //     System.debug(childItems.get('statistics'));
            // }
            System.debug(response.getBody());
            String body=response.getBody();
            fromJSON d = (fromJSON)JSON.deserialize(body, fromJSON.class);
            System.debug(d);
            return 'Success';
            // Deserialize the JSON string into collections of primitive data types.
            //fromJSON results = (fromJSON)JSON.deserialize(response.getBody(),fromJSON.class);
    
            /*for(Object animal: animals) {
            System.debug('success');
        }*/
        }
        else {
            //field = response.getStatusCode();
            System.debug('The status code returned was not expected: ' +
            response.getStatusCode() + ' ' + response.getStatus());
            return 'Error';
        }
        //System.debug('Check this line');
    }
        public class fromJSON {
            public Integer id;	//26
            public String node_id;	//MDEwOlJlcG9zaXRvcnkyNg==
            public String name;	//merb-core
            public String full_name;	//wycats/merb-core
            public boolean private_x;
            public cls_owner owner;
            public String html_url;	//https://github.com/wycats/merb-core
            public String description;	//Merb Core: All you need. None you don't.
            public boolean fork;
            public String url;	//https://api.github.com/repos/wycats/merb-core
            public String forks_url;	//https://api.github.com/repos/wycats/merb-core/forks
            public String keys_url;	//https://api.github.com/repos/wycats/merb-core/keys{/key_id}
            public String collaborators_url;	//https://api.github.com/repos/wycats/merb-core/collaborators{/collaborator}
            public String teams_url;	//https://api.github.com/repos/wycats/merb-core/teams
            public String hooks_url;	//https://api.github.com/repos/wycats/merb-core/hooks
            public String issue_events_url;	//https://api.github.com/repos/wycats/merb-core/issues/events{/number}
            public String events_url;	//https://api.github.com/repos/wycats/merb-core/events
            public String assignees_url;	//https://api.github.com/repos/wycats/merb-core/assignees{/user}
            public String branches_url;	//https://api.github.com/repos/wycats/merb-core/branches{/branch}
            public String tags_url;	//https://api.github.com/repos/wycats/merb-core/tags
            public String blobs_url;	//https://api.github.com/repos/wycats/merb-core/git/blobs{/sha}
            public String git_tags_url;	//https://api.github.com/repos/wycats/merb-core/git/tags{/sha}
            public String git_refs_url;	//https://api.github.com/repos/wycats/merb-core/git/refs{/sha}
            public String trees_url;	//https://api.github.com/repos/wycats/merb-core/git/trees{/sha}
            public String statuses_url;	//https://api.github.com/repos/wycats/merb-core/statuses/{sha}
            public String languages_url;	//https://api.github.com/repos/wycats/merb-core/languages
            public String stargazers_url;	//https://api.github.com/repos/wycats/merb-core/stargazers
            public String contributors_url;	//https://api.github.com/repos/wycats/merb-core/contributors
            public String subscribers_url;	//https://api.github.com/repos/wycats/merb-core/subscribers
            public String subscription_url;	//https://api.github.com/repos/wycats/merb-core/subscription
            public String commits_url;	//https://api.github.com/repos/wycats/merb-core/commits{/sha}
            public String git_commits_url;	//https://api.github.com/repos/wycats/merb-core/git/commits{/sha}
            public String comments_url;	//https://api.github.com/repos/wycats/merb-core/comments{/number}
            public String issue_comment_url;	//https://api.github.com/repos/wycats/merb-core/issues/comments{/number}
            public String contents_url;	//https://api.github.com/repos/wycats/merb-core/contents/{+path}
            public String compare_url;	//https://api.github.com/repos/wycats/merb-core/compare/{base}...{head}
            public String merges_url;	//https://api.github.com/repos/wycats/merb-core/merges
            public String archive_url;	//https://api.github.com/repos/wycats/merb-core/{archive_format}{/ref}
            public String downloads_url;	//https://api.github.com/repos/wycats/merb-core/downloads
            public String issues_url;	//https://api.github.com/repos/wycats/merb-core/issues{/number}
            public String pulls_url;	//https://api.github.com/repos/wycats/merb-core/pulls{/number}
            public String milestones_url;	//https://api.github.com/repos/wycats/merb-core/milestones{/number}
            public String notifications_url;	//https://api.github.com/repos/wycats/merb-core/notifications{?since,all,participating}
            public String labels_url;	//https://api.github.com/repos/wycats/merb-core/labels{/name}
            public String releases_url;	//https://api.github.com/repos/wycats/merb-core/releases{/id}
            public String deployments_url;	//https://api.github.com/repos/wycats/merb-core/deployments
            
            }
            class cls_owner {
                public String login;	//wycats
                public Integer id;	//4
                public String node_id;	//MDQ6VXNlcjQ=
                public String avatar_url;	//https://avatars.githubusercontent.com/u/4?v=4
                public String gravatar_id;	//
                public String url;	//https://api.github.com/users/wycats
                public String html_url;	//https://github.com/wycats
                public String followers_url;	//https://api.github.com/users/wycats/followers
                public String following_url;	//https://api.github.com/users/wycats/following{/other_user}
                public String gists_url;	//https://api.github.com/users/wycats/gists{/gist_id}
                public String starred_url;	//https://api.github.com/users/wycats/starred{/owner}{/repo}
                public String subscriptions_url;	//https://api.github.com/users/wycats/subscriptions
                public String organizations_url;	//https://api.github.com/users/wycats/orgs
                public String repos_url;	//https://api.github.com/users/wycats/repos
                public String events_url;	//https://api.github.com/users/wycats/events{/privacy}
                public String received_events_url;	//https://api.github.com/users/wycats/received_events
                public String type;	//User
                public boolean site_admin;
            }
}