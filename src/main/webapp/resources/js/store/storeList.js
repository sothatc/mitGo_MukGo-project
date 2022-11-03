/**
 * 
 */
 const tag = $(".storeList-tag-content>ul>li");
 
tag.on("click",function(){
    const index = tag.index(this);
    if(index < tag.length){
        for(i=0; i<tag.length;i++){
            $(tag).eq(i).css("color","black");
        }
    }
    $(tag).eq(index).css("color","#FF9F45");
});
/*
tag.on("click",function(){
    const tagValue = tag.index(this);
    
    $.ajax({
        url : "/ajaxClicktag.do?reqPage=1",
        data : {tagValue : tagValue},
        success : function(data){
            const storeList = $(".storeList-list");
            const storeListListContent = $("<div>");
            storeListListContent.addClass("storeList-list-content");
            for(let i=0;i<data.list.length;i++){
                const div = $("<div>");
                div.addClass("showList");
            	const a =  $("<a>");
                a.append("<div><img src='resources/upload/store/"+data.list[i].thumbNail+"'></img></div>");
            	a.append("<div><div>가게이름 : "+data.list[i].storeName+"</div></div>");
            	div.append(a);
                storeListListContent.append(div)
            }
            storeList.html(storeListListContent);
        }
    });
});

tag.on("click",function(){
    const tagValue = tag.index(this);
    const storeListListContent = $(".storeList-list-content");
    $.ajax({
        url : "/ajaxClicktag.do?reqPage=1",
        data : {tagValue : tagValue},
        success : function(data){
            
            for(let i=0;i<data.list.length;i++){
                const showTagList = $("#showTagList");
            	const a =  $("<a>");
                a.append("<div><img src='resources/upload/store/"+data.list[i].thumbNail+"'></img></div>");
            	a.append("<div><div>가게이름 : "+data.list[i].storeName+"</div></div>");
            	showTagList.append(a);
                storeListListContent.append(showTagList);
            }
            storeListListContent.html(showTagList)
        }
    });
});
*/
/*
var test = new Array();
tag.on("click",function(){
    const index = tag.index(this);
    if(test[index] == 0){
        $(tag).eq(index).css("color","#FF9F45");
        test[index] = 1;
    }else{
        $(tag).eq(index).css("color","black");
        test[index] = 0;
    }
});
for(i=0; i<tag.length;i++){
    tag.eq(i).click();
}
*/
const sort = $(".storeList-sort-content>ul>li");
sort.on("click",function(){
    const sortindex = sort.index(this);
    if(sortindex < sort.length){
        for(i=0; i<sort.length;i++){
            $(sort).eq(i).css("color","black");
        }
    }
    $(sort).eq(sortindex).css("color","#FF9F45");
});

const locationTag = $(".storeList-map-content>div");
locationTag.on("click",function(){
    const index = locationTag.index(this);
    const TagText = document.querySelector(".storeList-map-content>div>p");

    if(index < locationTag.length-1){
        const locationTagText = locationTag.eq(index).text();
        TagText.innerText = locationTagText+" 지역 맛집 찾기";
    }
});

