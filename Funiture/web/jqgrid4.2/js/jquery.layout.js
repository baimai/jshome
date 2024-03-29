/*
 * jquery.layout 1.2.0
 *
 * Copyright (c) 2008 
 *   Fabrizio Balliano (http://www.fabrizioballiano.net)
 *   Kevin Dalman (http://allpro.net)
 *
 * Dual licensed under the GPL (http://www.gnu.org/licenses/gpl.html)
 * and MIT (http://www.opensource.org/licenses/mit-license.php) licenses.
 *
 * $Date: 2008-12-27 02:17:22 +0100 (sab, 27 dic 2008) $
 * $Rev: 203 $
 * 
 * NOTE: For best code readability, view this with a fixed-space font and tabs equal to 4-chars
 */
(function($){
    $.fn.layout=function(opts){
        var
        prefix="ui-layout-",defaults={
            paneClass:prefix+"pane",
            resizerClass:prefix+"resizer",
            togglerClass:prefix+"toggler",
            togglerInnerClass:prefix+"",
            buttonClass:prefix+"button",
            contentSelector:"."+prefix+"content",
            contentIgnoreSelector:"."+prefix+"ignore"
            };

        var options={
            name:"",
            scrollToBookmarkOnLoad:true,
            defaults:{
                applyDefaultStyles:false,
                closable:true,
                resizable:true,
                slidable:true,
                contentSelector:defaults.contentSelector,
                contentIgnoreSelector:defaults.contentIgnoreSelector,
                paneClass:defaults.paneClass,
                resizerClass:defaults.resizerClass,
                togglerClass:defaults.togglerClass,
                buttonClass:defaults.buttonClass,
                resizerDragOpacity:1,
                maskIframesOnResize:true,
                minSize:0,
                maxSize:0,
                spacing_open:6,
                spacing_closed:6,
                togglerLength_open:50,
                togglerLength_closed:50,
                togglerAlign_open:"center",
                togglerAlign_closed:"center",
                togglerTip_open:"Close",
                togglerTip_closed:"Open",
                resizerTip:"Resize",
                sliderTip:"Slide Open",
                sliderCursor:"pointer",
                slideTrigger_open:"click",
                slideTrigger_close:"mouseout",
                hideTogglerOnSlide:false,
                togglerContent_open:"",
                togglerContent_closed:"",
                showOverflowOnHover:false,
                enableCursorHotkey:true,
                customHotkeyModifier:"SHIFT",
                fxName:"slide",
                fxSpeed:null,
                fxSettings:{},
                initClosed:false,
                initHidden:false
            },
            north:{
                paneSelector:"."+prefix+"north",
                size:"auto",
                resizerCursor:"n-resize"
            },
            south:{
                paneSelector:"."+prefix+"south",
                size:"auto",
                resizerCursor:"s-resize"
            },
            east:{
                paneSelector:"."+prefix+"east",
                size:200,
                resizerCursor:"e-resize"
            },
            west:{
                paneSelector:"."+prefix+"west",
                size:200,
                resizerCursor:"w-resize"
            },
            center:{
                paneSelector:"."+prefix+"center"
                }
            };

    var effects={
        slide:{
            all:{
                duration:"fast"
            },
            north:{
                direction:"up"
            },
            south:{
                direction:"down"
            },
            east:{
                direction:"right"
            },
            west:{
                direction:"left"
            }
        },
    drop:{
        all:{
            duration:"slow"
        },
        north:{
            direction:"up"
        },
        south:{
            direction:"down"
        },
        east:{
            direction:"right"
        },
        west:{
            direction:"left"
        }
    },
scale:{
    all:{
        duration:"fast"
    }
}
};

var config={
    allPanes:"north,south,east,west,center",
    borderPanes:"north,south,east,west",
    zIndex:{
        resizer_normal:1,
        pane_normal:2,
        mask:4,
        sliding:100,
        resizing:10000,
        animation:10000
    },
    resizers:{
        cssReq:{
            position:"absolute",
            padding:0,
            margin:0,
            fontSize:"1px",
            textAlign:"left",
            overflow:"hidden",
            zIndex:1
        },
        cssDef:{
            background:"#DDD",
            border:"none"
        }
    },
togglers:{
    cssReq:{
        position:"absolute",
        display:"block",
        padding:0,
        margin:0,
        overflow:"hidden",
        textAlign:"center",
        fontSize:"1px",
        cursor:"pointer",
        zIndex:1
    },
    cssDef:{
        background:"#AAA"
    }
},
content:{
    cssReq:{
        overflow:"auto"
    },
    cssDef:{}
},
defaults:{
    cssReq:{
        position:"absolute",
        margin:0,
        zIndex:2
    },
    cssDef:{
        padding:"10px",
        background:"#FFF",
        border:"1px solid #BBB",
        overflow:"auto"
    }
},
north:{
    edge:"top",
    sizeType:"height",
    dir:"horz",
    cssReq:{
        top:0,
        bottom:"auto",
        left:0,
        right:0,
        width:"auto"
    }
},
south:{
    edge:"bottom",
    sizeType:"height",
    dir:"horz",
    cssReq:{
        top:"auto",
        bottom:0,
        left:0,
        right:0,
        width:"auto"
    }
},
east:{
    edge:"right",
    sizeType:"width",
    dir:"vert",
    cssReq:{
        left:"auto",
        right:0,
        top:"auto",
        bottom:"auto",
        height:"auto"
    }
},
west:{
    edge:"left",
    sizeType:"width",
    dir:"vert",
    cssReq:{
        left:0,
        right:"auto",
        top:"auto",
        bottom:"auto",
        height:"auto"
    }
},
center:{
    dir:"center",
    cssReq:{
        left:"auto",
        right:"auto",
        top:"auto",
        bottom:"auto",
        height:"auto",
        width:"auto"
    }
}
};

var state={
    id:Math.floor(Math.random()*10000),
    container:{},
    north:{},
    south:{},
    east:{},
    west:{},
    center:{}
};

var
altEdge={
    top:"bottom",
    bottom:"top",
    left:"right",
    right:"left"
},altSide={
    north:"south",
    south:"north",
    east:"west",
    west:"east"
};

var isStr=function(o){
    if(typeof o=="string")return true;
    else if(typeof o=="object"){
        try{
            var match=o.constructor.toString().match(/string/i);
            return(match!==null);
        }catch(e){}
    }
    return false;
};

var str=function(o){
    if(typeof o=="string"||isStr(o))return $.trim(o);else return o;
};

var min=function(x,y){
    return Math.min(x,y);
};

var max=function(x,y){
    return Math.max(x,y);
};

var transformData=function(d){
    var json={
        defaults:{
            fxSettings:{}
    },
    north:{
        fxSettings:{}
},
south:{
    fxSettings:{}
},
east:{
    fxSettings:{}
},
west:{
    fxSettings:{}
},
center:{
    fxSettings:{}
}
};

d=d||{};

if(d.effects||d.defaults||d.north||d.south||d.west||d.east||d.center)json=$.extend(json,d);else
    $.each(d,function(key,val){
        a=key.split("__");
        json[a[1]?a[0]:"defaults"][a[1]?a[1]:a[0]]=val;
    });
return json;
};

var setFlowCallback=function(action,pane,param){
    var
    cb=action+","+pane+","+(param?1:0),cP,cbPane;
    $.each(c.borderPanes.split(","),function(i,p){
        if(c[p].isMoving){
            bindCallback(p);
            return false;
        }
    });
function bindCallback(p,test){
    cP=c[p];
    if(!cP.doCallback){
        cP.doCallback=true;
        cP.callback=cb;
    }else{
        cpPane=cP.callback.split(",")[1];
        if(cpPane!=p&&cpPane!=pane)bindCallback(cpPane,true);
    }
}
};

var execFlowCallback=function(pane){
    var cP=c[pane];
    c.isLayoutBusy=false;
    delete cP.isMoving;
    if(!cP.doCallback||!cP.callback)return;
    cP.doCallback=false;
    var
    cb=cP.callback.split(","),param=(cb[2]>0?true:false);
    if(cb[0]=="open")open(cb[1],param);
    else if(cb[0]=="close")close(cb[1],param);
    if(!cP.doCallback)cP.callback=null;
};

var execUserCallback=function(pane,v_fn){
    if(!v_fn)return;
    var fn;
    try{
        if(typeof v_fn=="function")fn=v_fn;
        else if(typeof v_fn!="string")return;
        else if(v_fn.indexOf(",")>0){
            var
            args=v_fn.split(","),fn=eval(args[0]);
            if(typeof fn=="function"&&args.length>1)return fn(args[1]);
        }else
            fn=eval(v_fn);
        if(typeof fn=="function")return fn(pane,$Ps[pane],$.extend({},state[pane]),$.extend({},options[pane]),options.name);
    }catch(ex){}
};

var cssNum=function($E,prop){
    var
    val=0,hidden=false,visibility="";
    if(!$.browser.msie){
        if($.curCSS($E[0],"display",true)=="none"){
            hidden=true;
            visibility=$.curCSS($E[0],"visibility",true);
            $E.css({
                display:"block",
                visibility:"hidden"
            });
        }
    }
    val=parseInt($.curCSS($E[0],prop,true),10)||0;
if(hidden){
    $E.css({
        display:"none"
    });
    if(visibility&&visibility!="hidden")$E.css({
        visibility:visibility
    });
}
return val;
};

var cssW=function(e,outerWidth){
    var $E;
    if(isStr(e)){
        e=str(e);
        $E=$Ps[e];
    }else
        $E=$(e);
    if(outerWidth<=0)return 0;
    else if(!(outerWidth>0))outerWidth=isStr(e)?getPaneSize(e):$E.outerWidth();
    if(!$.boxModel)return outerWidth;else
        return outerWidth
        -cssNum($E,"paddingLeft")-cssNum($E,"paddingRight")-($.curCSS($E[0],"borderLeftStyle",true)=="none"?0:cssNum($E,"borderLeftWidth"))-($.curCSS($E[0],"borderRightStyle",true)=="none"?0:cssNum($E,"borderRightWidth"));
};

var cssH=function(e,outerHeight){
    var $E;
    if(isStr(e)){
        e=str(e);
        $E=$Ps[e];
    }else
        $E=$(e);
    if(outerHeight<=0)return 0;
    else if(!(outerHeight>0))outerHeight=(isStr(e))?getPaneSize(e):$E.outerHeight();
    if(!$.boxModel)return outerHeight;else
        return outerHeight
        -cssNum($E,"paddingTop")-cssNum($E,"paddingBottom")-($.curCSS($E[0],"borderTopStyle",true)=="none"?0:cssNum($E,"borderTopWidth"))-($.curCSS($E[0],"borderBottomStyle",true)=="none"?0:cssNum($E,"borderBottomWidth"));
};

var cssSize=function(pane,outerSize){
    if(c[pane].dir=="horz")return cssH(pane,outerSize);else
        return cssW(pane,outerSize);
};

var getPaneSize=function(pane,inclSpace){
    var
    $P=$Ps[pane],o=options[pane],s=state[pane],oSp=(inclSpace?o.spacing_open:0),cSp=(inclSpace?o.spacing_closed:0);
    if(!$P||s.isHidden)return 0;
    else if(s.isClosed||(s.isSliding&&inclSpace))return cSp;
    else if(c[pane].dir=="horz")return $P.outerHeight()+oSp;else
        return $P.outerWidth()+oSp;
};

var setPaneMinMaxSizes=function(pane){
    var
    d=cDims,edge=c[pane].edge,dir=c[pane].dir,o=options[pane],s=state[pane],$P=$Ps[pane],$altPane=$Ps[altSide[pane]],paneSpacing=o.spacing_open,altPaneSpacing=options[altSide[pane]].spacing_open,altPaneSize=(!$altPane?0:(dir=="horz"?$altPane.outerHeight():$altPane.outerWidth())),containerSize=(dir=="horz"?d.innerHeight:d.innerWidth),limitSize=containerSize-paneSpacing-altPaneSize-altPaneSpacing,minSize=s.minSize||0,maxSize=Math.min(s.maxSize||9999,limitSize),minPos,maxPos;
    switch(pane){
        case"north":
            minPos=d.offsetTop+minSize;
            maxPos=d.offsetTop+maxSize;
            break;
        case"west":
            minPos=d.offsetLeft+minSize;
            maxPos=d.offsetLeft+maxSize;
            break;
        case"south":
            minPos=d.offsetTop+d.innerHeight-maxSize;
            maxPos=d.offsetTop+d.innerHeight-minSize;
            break;
        case"east":
            minPos=d.offsetLeft+d.innerWidth-maxSize;
            maxPos=d.offsetLeft+d.innerWidth-minSize;
            break;
    }
    $.extend(s,{
        minSize:minSize,
        maxSize:maxSize,
        minPosition:minPos,
        maxPosition:maxPos
    });
};

var getPaneDims=function(){
    var d={
        top:getPaneSize("north",true),
        bottom:getPaneSize("south",true),
        left:getPaneSize("west",true),
        right:getPaneSize("east",true),
        width:0,
        height:0
    };

    with(d){
        width=cDims.innerWidth-left-right;
        height=cDims.innerHeight-bottom-top;
        top+=cDims.top;
        bottom+=cDims.bottom;
        left+=cDims.left;
        right+=cDims.right;
        }
        return d;
};

var getElemDims=function($E){
    var
    d={},e,b,p;
    $.each("Left,Right,Top,Bottom".split(","),function(){
        e=str(this);
        b=d["border"+e]=cssNum($E,"border"+e+"Width");
        p=d["padding"+e]=cssNum($E,"padding"+e);
        d["offset"+e]=b+p;
        if($E==$Container)d[e.toLowerCase()]=($.boxModel?p:0);
    });
    d.innerWidth=d.outerWidth=$E.outerWidth();
    d.innerHeight=d.outerHeight=$E.outerHeight();
    if($.boxModel){
        d.innerWidth-=(d.offsetLeft+d.offsetRight);
        d.innerHeight-=(d.offsetTop+d.offsetBottom);
    }
    return d;
};

var setTimer=function(pane,action,fn,ms){
    var
    Layout=window.layout=window.layout||{},Timers=Layout.timers=Layout.timers||{},name="layout_"+state.id+"_"+pane+"_"+action;
    if(Timers[name])return;else Timers[name]=setTimeout(fn,ms);
};

var clearTimer=function(pane,action){
    var
    Layout=window.layout=window.layout||{},Timers=Layout.timers=Layout.timers||{},name="layout_"+state.id+"_"+pane+"_"+action;
    if(Timers[name]){
        clearTimeout(Timers[name]);
        delete Timers[name];
        return true;
    }else
        return false;
};

var create=function(){
    initOptions();
    initContainer();
    initPanes();
    initHandles();
    initResizable();
    sizeContent("all");
    if(options.scrollToBookmarkOnLoad)with(self.location)if(hash)replace(hash);initHotkeys();
    $(window).resize(function(){
        var timerID="timerLayout_"+state.id;
        if(window[timerID])clearTimeout(window[timerID]);
        window[timerID]=null;
        if(true||$.browser.msie)window[timerID]=setTimeout(resizeAll,100);else
            resizeAll();
    });
};

var initContainer=function(){
    try{
        if($Container[0].tagName=="BODY"){
            $("html").css({
                height:"100%",
                overflow:"hidden"
            });
            $("body").css({
                position:"relative",
                height:"100%",
                overflow:"hidden",
                margin:0,
                padding:0,
                border:"none"
            });
        }else{
            var
            CSS={
                overflow:"hidden"
            },p=$Container.css("position"),h=$Container.css("height");
            if(!$Container.hasClass("ui-layout-pane")){
                if(!p||"fixed,absolute,relative".indexOf(p)<0)CSS.position="relative";
                if(!h||h=="auto")CSS.height="100%";
            }
            $Container.css(CSS);
        }
    }catch(ex){}
cDims=state.container=getElemDims($Container);
};

var initHotkeys=function(){
    $.each(c.borderPanes.split(","),function(i,pane){
        var o=options[pane];
        if(o.enableCursorHotkey||o.customHotkey){
            $(document).keydown(keyDown);
            return false;
        }
    });
};

var initOptions=function(){
    opts=transformData(opts);
    if(opts.effects){
        $.extend(effects,opts.effects);
        delete opts.effects;
    }
    $.each("name,scrollToBookmarkOnLoad".split(","),function(idx,key){
        if(opts[key]!==undefined)options[key]=opts[key];
        else if(opts.defaults[key]!==undefined){
            options[key]=opts.defaults[key];
            delete opts.defaults[key];
        }
    });
$.each("paneSelector,resizerCursor,customHotkey".split(","),function(idx,key){
    delete opts.defaults[key];
});
$.extend(options.defaults,opts.defaults);
c.center=$.extend(true,{},c.defaults,c.center);
$.extend(options.center,opts.center);
var o_Center=$.extend(true,{},options.defaults,opts.defaults,options.center);
$.each("paneClass,contentSelector,contentIgnoreSelector,applyDefaultStyles,showOverflowOnHover".split(","),function(idx,key){
    options.center[key]=o_Center[key];
});
var defs=options.defaults;
$.each(c.borderPanes.split(","),function(i,pane){
    c[pane]=$.extend(true,{},c.defaults,c[pane]);
    o=options[pane]=$.extend(true,{},options.defaults,options[pane],opts.defaults,opts[pane]);
    if(!o.paneClass)o.paneClass=defaults.paneClass;
    if(!o.resizerClass)o.resizerClass=defaults.resizerClass;
    if(!o.togglerClass)o.togglerClass=defaults.togglerClass;
    $.each(["_open","_close",""],function(i,n){
        var
        sName="fxName"+n,sSpeed="fxSpeed"+n,sSettings="fxSettings"+n;
        o[sName]=opts[pane][sName]||opts[pane].fxName||opts.defaults[sName]||opts.defaults.fxName||o[sName]||o.fxName||defs[sName]||defs.fxName||"none";
        var fxName=o[sName];
        if(fxName=="none"||!$.effects||!$.effects[fxName]||(!effects[fxName]&&!o[sSettings]&&!o.fxSettings))fxName=o[sName]="none";
        var
        fx=effects[fxName]||{},fx_all=fx.all||{},fx_pane=fx[pane]||{};

        o[sSettings]=$.extend({},fx_all,fx_pane,defs.fxSettings||{},defs[sSettings]||{},o.fxSettings,o[sSettings],opts.defaults.fxSettings,opts.defaults[sSettings]||{},opts[pane].fxSettings,opts[pane][sSettings]||{});
        o[sSpeed]=opts[pane][sSpeed]||opts[pane].fxSpeed||opts.defaults[sSpeed]||opts.defaults.fxSpeed||o[sSpeed]||o[sSettings].duration||o.fxSpeed||o.fxSettings.duration||defs.fxSpeed||defs.fxSettings.duration||fx_pane.duration||fx_all.duration||"normal";
    });
});
};

var initPanes=function(){
    $.each(c.allPanes.split(","),function(){
        var
        pane=str(this),o=options[pane],s=state[pane],fx=s.fx,dir=c[pane].dir,size=o.size=="auto"||isNaN(o.size)?0:o.size,minSize=o.minSize||1,maxSize=o.maxSize||9999,spacing=o.spacing_open||0,sel=o.paneSelector,isIE6=($.browser.msie&&$.browser.version<7),CSS={},$P,$C;
        $Cs[pane]=false;
        if(sel.substr(0,1)==="#")$P=$Ps[pane]=$Container.find(sel+":first");
        else{
            $P=$Ps[pane]=$Container.children(sel+":first");
            if(!$P.length)$P=$Ps[pane]=$Container.children("form:first").children(sel+":first");
        }
        if(!$P.length){
            $Ps[pane]=false;
            return true;
        }
        $P.attr("pane",pane).addClass(o.paneClass+" "+o.paneClass+"-"+pane);
        if(pane!="center"){
            s.isClosed=false;
            s.isSliding=false;
            s.isResizing=false;
            s.isHidden=false;
            s.noRoom=false;
            c[pane].pins=[];
        }
        CSS=$.extend({
            visibility:"visible",
            display:"block"
        },c.defaults.cssReq,c[pane].cssReq);
        if(o.applyDefaultStyles)$.extend(CSS,c.defaults.cssDef,c[pane].cssDef);
        $P.css(CSS);
        CSS={};

        switch(pane){
            case"north":
                CSS.top=cDims.top;
                CSS.left=cDims.left;
                CSS.right=cDims.right;
                break;
            case"south":
                CSS.bottom=cDims.bottom;
                CSS.left=cDims.left;
                CSS.right=cDims.right;
                break;
            case"west":
                CSS.left=cDims.left;
                break;
            case"east":
                CSS.right=cDims.right;
                break;
            case"center":
        }
        if(dir=="horz"){
            if(size===0||size=="auto"){
                $P.css({
                    height:"auto"
                });
                size=$P.outerHeight();
            }
            size=max(size,minSize);
            size=min(size,maxSize);
            size=min(size,cDims.innerHeight-spacing);
            CSS.height=max(1,cssH(pane,size));
            s.size=size;
            s.maxSize=maxSize;
            s.minSize=max(minSize,size-CSS.height+1);
            $P.css(CSS);
        }else if(dir=="vert"){
            if(size===0||size=="auto"){
                $P.css({
                    width:"auto",
                    float:"left"
                });
                size=$P.outerWidth();
                $P.css({
                    float:"none"
                });
            }
            size=max(size,minSize);
            size=min(size,maxSize);
            size=min(size,cDims.innerWidth-spacing);
            CSS.width=max(1,cssW(pane,size));
            s.size=size;
            s.maxSize=maxSize;
            s.minSize=max(minSize,size-CSS.width+1);
            $P.css(CSS);
            sizeMidPanes(pane,null,true);
        }else if(pane=="center"){
            $P.css(CSS);
            sizeMidPanes("center",null,true);
        }
        if(o.initClosed&&o.closable){
            $P.hide().addClass("closed");
            s.isClosed=true;
        }else if(o.initHidden||o.initClosed){
            hide(pane,true);
            s.isHidden=true;
        }else
            $P.addClass("open");
        if(o.showOverflowOnHover)$P.hover(allowOverflow,resetOverflow);
        if(o.contentSelector){
            $C=$Cs[pane]=$P.children(o.contentSelector+":first");
            if(!$C.length){
                $Cs[pane]=false;
                return true;
            }
            $C.css(c.content.cssReq);
            if(o.applyDefaultStyles)$C.css(c.content.cssDef);
            $P.css({
                overflow:"hidden"
            });
        }
    });
};

var initHandles=function(){
    $.each(c.borderPanes.split(","),function(){
        var
        pane=str(this),o=options[pane],s=state[pane],rClass=o.resizerClass,tClass=o.togglerClass,$P=$Ps[pane];
        $Rs[pane]=false;
        $Ts[pane]=false;
        if(!$P||(!o.closable&&!o.resizable))return;
        var
        edge=c[pane].edge,isOpen=$P.is(":visible"),spacing=(isOpen?o.spacing_open:o.spacing_closed),_pane="-"+pane,_state=(isOpen?"-open":"-closed"),$R,$T;
        $R=$Rs[pane]=$("<span></span>");
        if(isOpen&&o.resizable);
        else if(!isOpen&&o.slidable)$R.attr("title",o.sliderTip).css("cursor",o.sliderCursor);
        $R.attr("id",(o.paneSelector.substr(0,1)=="#"?o.paneSelector.substr(1)+"-resizer":"")).attr("resizer",pane).css(c.resizers.cssReq).css(edge,cDims[edge]+getPaneSize(pane)).addClass(rClass+" "+rClass+_pane+" "+rClass+_state+" "+rClass+_pane+_state).appendTo($Container);
        if(o.applyDefaultStyles)$R.css(c.resizers.cssDef);
        if(o.closable){
            $T=$Ts[pane]=$("<div></div>");
            $T.attr("id",(o.paneSelector.substr(0,1)=="#"?o.paneSelector.substr(1)+"-toggler":"")).css(c.togglers.cssReq).attr("title",(isOpen?o.togglerTip_open:o.togglerTip_closed)).click(function(evt){
                toggle(pane);
                evt.stopPropagation();
            }).mouseover(function(evt){
                evt.stopPropagation();
            }).addClass(tClass+" "+tClass+_pane+" "+tClass+_state+" "+tClass+_pane+_state).appendTo($R);
            if(o.togglerContent_open)$("<span>"+o.togglerContent_open+"</span>").addClass("content content-open").css("display",s.isClosed?"none":"block").appendTo($T);
            if(o.togglerContent_closed)$("<span>"+o.togglerContent_closed+"</span>").addClass("content content-closed").css("display",s.isClosed?"block":"none").appendTo($T);
            if(o.applyDefaultStyles)$T.css(c.togglers.cssDef);
            if(!isOpen)bindStartSlidingEvent(pane,true);
        }
    });
sizeHandles("all",true);
};

var initResizable=function(){
    var
    draggingAvailable=(typeof $.fn.draggable=="function"),minPosition,maxPosition,edge;
    $.each(c.borderPanes.split(","),function(){
        var
        pane=str(this),o=options[pane],s=state[pane];
        if(!draggingAvailable||!$Ps[pane]||!o.resizable){
            o.resizable=false;
            return true;
        }
        var
        rClass=o.resizerClass,dragClass=rClass+"-drag",dragPaneClass=rClass+"-"+pane+"-drag",draggingClass=rClass+"-dragging",draggingPaneClass=rClass+"-"+pane+"-dragging",draggingClassSet=false,$P=$Ps[pane],$R=$Rs[pane];
        if(!s.isClosed)$R.attr("title",o.resizerTip).css("cursor",o.resizerCursor);
        $R.draggable({
            containment:$Container[0],
            axis:(c[pane].dir=="horz"?"y":"x"),
            delay:200,
            distance:1,
            helper:"clone",
            opacity:o.resizerDragOpacity,
            zIndex:c.zIndex.resizing,
            start:function(e,ui){
                if(false===execUserCallback(pane,o.onresize_start))return false;
                s.isResizing=true;
                clearTimer(pane,"closeSlider");
                $R.addClass(dragClass+" "+dragPaneClass);
                draggingClassSet=false;
                var resizerWidth=(pane=="east"||pane=="south"?o.spacing_open:0);
                setPaneMinMaxSizes(pane);
                s.minPosition-=resizerWidth;
                s.maxPosition-=resizerWidth;
                edge=(c[pane].dir=="horz"?"top":"left");
                $(o.maskIframesOnResize===true?"iframe":o.maskIframesOnResize).each(function(){
                    $('<div class="ui-layout-mask"/>').css({
                        background:"#fff",
                        opacity:"0.001",
                        zIndex:9,
                        position:"absolute",
                        width:this.offsetWidth+"px",
                        height:this.offsetHeight+"px"
                        }).css($(this).offset()).appendTo(this.parentNode);
                });
            },
            drag:function(e,ui){
                if(!draggingClassSet){
                    $(".ui-draggable-dragging").addClass(draggingClass+" "+draggingPaneClass).children().css("visibility","hidden");
                    draggingClassSet=true;
                    if(s.isSliding)$Ps[pane].css("zIndex",c.zIndex.sliding);
                }
                if(ui.position[edge]<s.minPosition)ui.position[edge]=s.minPosition;
                else if(ui.position[edge]>s.maxPosition)ui.position[edge]=s.maxPosition;
            },
            stop:function(e,ui){
                var
                dragPos=ui.position,resizerPos,newSize;
                $R.removeClass(dragClass+" "+dragPaneClass);
                switch(pane){
                    case"north":
                        resizerPos=dragPos.top;
                        break;
                    case"west":
                        resizerPos=dragPos.left;
                        break;
                    case"south":
                        resizerPos=cDims.outerHeight-dragPos.top-$R.outerHeight();
                        break;
                    case"east":
                        resizerPos=cDims.outerWidth-dragPos.left-$R.outerWidth();
                        break;
                }
                newSize=resizerPos-cDims[c[pane].edge];
                sizePane(pane,newSize);
                $("div.ui-layout-mask").remove();
                s.isResizing=false;
            }
        });
    });
};

var hide=function(pane,onInit){
    var
    o=options[pane],s=state[pane],$P=$Ps[pane],$R=$Rs[pane];
    if(!$P||s.isHidden)return;
    if(false===execUserCallback(pane,o.onhide_start))return;
    s.isSliding=false;
    if($R)$R.hide();
    if(onInit||s.isClosed){
        s.isClosed=true;
        s.isHidden=true;
        $P.hide();
        sizeMidPanes(c[pane].dir=="horz"?"all":"center");
        execUserCallback(pane,o.onhide_end||o.onhide);
    }else{
        s.isHiding=true;
        close(pane,false);
    }
};

var show=function(pane,openPane){
    var
    o=options[pane],s=state[pane],$P=$Ps[pane],$R=$Rs[pane];
    if(!$P||!s.isHidden)return;
    if(false===execUserCallback(pane,o.onshow_start))return;
    s.isSliding=false;
    s.isShowing=true;
    if($R&&o.spacing_open>0)$R.show();
    if(openPane===false)close(pane,true);else
        open(pane);
};

var toggle=function(pane){
    var s=state[pane];
    if(s.isHidden)show(pane);
    else if(s.isClosed)open(pane);else
        close(pane);
};

var close=function(pane,force,noAnimation){
    var
    $P=$Ps[pane],$R=$Rs[pane],$T=$Ts[pane],o=options[pane],s=state[pane],doFX=!noAnimation&&!s.isClosed&&(o.fxName_close!="none"),edge=c[pane].edge,rClass=o.resizerClass,tClass=o.togglerClass,_pane="-"+pane,_open="-open",_sliding="-sliding",_closed="-closed",isShowing=s.isShowing,isHiding=s.isHiding;
    delete s.isShowing;
    delete s.isHiding;
    if(!$P||(!o.resizable&&!o.closable))return;
    else if(!force&&s.isClosed&&!isShowing)return;
    if(c.isLayoutBusy){
        setFlowCallback("close",pane,force);
        return;
    }
    if(!isShowing&&false===execUserCallback(pane,o.onclose_start))return;
    c[pane].isMoving=true;
    c.isLayoutBusy=true;
    s.isClosed=true;
    if(isHiding)s.isHidden=true;
    else if(isShowing)s.isHidden=false;
    syncPinBtns(pane,false);
    if(!s.isSliding)sizeMidPanes(c[pane].dir=="horz"?"all":"center");
    if($R){
        $R.css(edge,cDims[edge]).removeClass(rClass+_open+" "+rClass+_pane+_open).removeClass(rClass+_sliding+" "+rClass+_pane+_sliding).addClass(rClass+_closed+" "+rClass+_pane+_closed);
        if(o.resizable)$R.draggable("disable").css("cursor","default").attr("title","");
        if($T){
            $T.removeClass(tClass+_open+" "+tClass+_pane+_open).addClass(tClass+_closed+" "+tClass+_pane+_closed).attr("title",o.togglerTip_closed);
        }
        sizeHandles();
    }
    if(doFX){
        lockPaneForFX(pane,true);
        $P.hide(o.fxName_close,o.fxSettings_close,o.fxSpeed_close,function(){
            lockPaneForFX(pane,false);
            if(!s.isClosed)return;
            close_2();
        });
    }else{
        $P.hide();
        close_2();
    }
    function close_2(){
        bindStartSlidingEvent(pane,true);
        if(!isShowing)execUserCallback(pane,o.onclose_end||o.onclose);
        if(isShowing)execUserCallback(pane,o.onshow_end||o.onshow);
        if(isHiding)execUserCallback(pane,o.onhide_end||o.onhide);
        execFlowCallback(pane);
    }
};

var open=function(pane,slide,noAnimation){
    var
    $P=$Ps[pane],$R=$Rs[pane],$T=$Ts[pane],o=options[pane],s=state[pane],doFX=!noAnimation&&s.isClosed&&(o.fxName_open!="none"),edge=c[pane].edge,rClass=o.resizerClass,tClass=o.togglerClass,_pane="-"+pane,_open="-open",_closed="-closed",_sliding="-sliding",isShowing=s.isShowing;
    delete s.isShowing;
    if(!$P||(!o.resizable&&!o.closable))return;
    else if(!s.isClosed&&!s.isSliding)return;
    if(s.isHidden&&!isShowing){
        show(pane,true);
        return;
    }
    if(c.isLayoutBusy){
        setFlowCallback("open",pane,slide);
        return;
    }
    if(false===execUserCallback(pane,o.onopen_start))return;
    c[pane].isMoving=true;
    c.isLayoutBusy=true;
    if(s.isSliding&&!slide)bindStopSlidingEvents(pane,false);
    s.isClosed=false;
    if(isShowing)s.isHidden=false;
    setPaneMinMaxSizes(pane);
    if(s.size>s.maxSize)$P.css(c[pane].sizeType,max(1,cssSize(pane,s.maxSize)));
    bindStartSlidingEvent(pane,false);
    if(doFX){
        lockPaneForFX(pane,true);
        $P.show(o.fxName_open,o.fxSettings_open,o.fxSpeed_open,function(){
            lockPaneForFX(pane,false);
            if(s.isClosed)return;
            open_2();
        });
    }else{
        $P.show();
        open_2();
    }
    function open_2(){
        if(!s.isSliding)sizeMidPanes(c[pane].dir=="vert"?"center":"all");
        if($R){
            $R.css(edge,cDims[edge]+getPaneSize(pane)).removeClass(rClass+_closed+" "+rClass+_pane+_closed).addClass(rClass+_open+" "+rClass+_pane+_open).addClass(!s.isSliding?"":rClass+_sliding+" "+rClass+_pane+_sliding);
            if(o.resizable)$R.draggable("enable").css("cursor",o.resizerCursor).attr("title",o.resizerTip);else
                $R.css("cursor","default");
            if($T){
                $T.removeClass(tClass+_closed+" "+tClass+_pane+_closed).addClass(tClass+_open+" "+tClass+_pane+_open).attr("title",o.togglerTip_open);
            }
            sizeHandles("all");
        }
        sizeContent(pane);
        syncPinBtns(pane,!s.isSliding);
        execUserCallback(pane,o.onopen_end||o.onopen);
        if(isShowing)execUserCallback(pane,o.onshow_end||o.onshow);
        execFlowCallback(pane);
    }
};

var lockPaneForFX=function(pane,doLock){
    var $P=$Ps[pane];
    if(doLock){
        $P.css({
            zIndex:c.zIndex.animation
            });
        if(pane=="south")$P.css({
            top:cDims.top+cDims.innerHeight-$P.outerHeight()
            });
        else if(pane=="east")$P.css({
            left:cDims.left+cDims.innerWidth-$P.outerWidth()
            });
    }else{
        if(!state[pane].isSliding)$P.css({
            zIndex:c.zIndex.pane_normal
            });
        if(pane=="south")$P.css({
            top:"auto"
        });
        else if(pane=="east")$P.css({
            left:"auto"
        });
    }
};

var bindStartSlidingEvent=function(pane,enable){
    var
    o=options[pane],$R=$Rs[pane],trigger=o.slideTrigger_open;
    if(!$R||!o.slidable)return;
    if(trigger!="click"&&trigger!="dblclick"&&trigger!="mouseover")trigger="click";
    $R
    [enable?"bind":"unbind"](trigger,slideOpen).css("cursor",(enable?o.sliderCursor:"default")).attr("title",(enable?o.sliderTip:""));
};

var bindStopSlidingEvents=function(pane,enable){
    var
    o=options[pane],s=state[pane],trigger=o.slideTrigger_close,action=(enable?"bind":"unbind"),$P=$Ps[pane],$R=$Rs[pane];
    s.isSliding=enable;
    clearTimer(pane,"closeSlider");
    $P.css({
        zIndex:(enable?c.zIndex.sliding:c.zIndex.pane_normal)
        });
    $R.css({
        zIndex:(enable?c.zIndex.sliding:c.zIndex.resizer_normal)
        });
    if(trigger!="click"&&trigger!="mouseout")trigger="mouseout";
    if(enable){
        $P.bind(trigger,slideClosed);
        $R.bind(trigger,slideClosed);
        if(trigger="mouseout"){
            $P.bind("mouseover",cancelMouseOut);
            $R.bind("mouseover",cancelMouseOut);
        }
    }else{
    $P.unbind(trigger);
    $R.unbind(trigger);
    if(trigger="mouseout"){
        $P.unbind("mouseover");
        $R.unbind("mouseover");
        clearTimer(pane,"closeSlider");
    }
}
function cancelMouseOut(evt){
    clearTimer(pane,"closeSlider");
    evt.stopPropagation();
}
};

var slideOpen=function(){
    var pane=$(this).attr("resizer");
    if(state[pane].isClosed){
        bindStopSlidingEvents(pane,true);
        open(pane,true);
    }
};

var slideClosed=function(){
    var
    $E=$(this),pane=$E.attr("pane")||$E.attr("resizer"),o=options[pane],s=state[pane];
    if(s.isClosed||s.isResizing)return;
    else if(o.slideTrigger_close=="click")close_NOW();else
        setTimer(pane,"closeSlider",close_NOW,300);
    function close_NOW(){
        bindStopSlidingEvents(pane,false);
        if(!s.isClosed)close(pane);
    }
};

var sizePane=function(pane,size){
    var
    edge=c[pane].edge,dir=c[pane].dir,o=options[pane],s=state[pane],$P=$Ps[pane],$R=$Rs[pane];
    setPaneMinMaxSizes(pane);
    s.minSize=max(s.minSize,o.minSize);
    if(o.maxSize>0)s.maxSize=min(s.maxSize,o.maxSize);
    size=max(size,s.minSize);
    size=min(size,s.maxSize);
    s.size=size;
    $R.css(edge,size+cDims[edge]);
    $P.css(c[pane].sizeType,max(1,cssSize(pane,size)));
    if(!s.isSliding)sizeMidPanes(dir=="horz"?"all":"center");
    sizeHandles();
    sizeContent(pane);
    execUserCallback(pane,o.onresize_end||o.onresize);
};

var sizeMidPanes=function(panes,overrideDims,onInit){
    if(!panes||panes=="all")panes="east,west,center";
    var d=getPaneDims();
    if(overrideDims)$.extend(d,overrideDims);
    $.each(panes.split(","),function(){
        if(!$Ps[this])return;
        var
        pane=str(this),o=options[pane],s=state[pane],$P=$Ps[pane],$R=$Rs[pane],hasRoom=true,CSS={};

        if(pane=="center"){
            d=getPaneDims();
            CSS=$.extend({},d);
            CSS.width=max(1,cssW(pane,CSS.width));
            CSS.height=max(1,cssH(pane,CSS.height));
            hasRoom=(CSS.width>1&&CSS.height>1);
            if($.browser.msie&&(!$.boxModel||$.browser.version<7)){
                if($Ps.north)$Ps.north.css({
                    width:cssW($Ps.north,cDims.innerWidth)
                    });
                if($Ps.south)$Ps.south.css({
                    width:cssW($Ps.south,cDims.innerWidth)
                    });
            }
        }else{
        CSS.top=d.top;
        CSS.bottom=d.bottom;
        CSS.height=max(1,cssH(pane,d.height));
        hasRoom=(CSS.height>1);
    }
    if(hasRoom){
        $P.css(CSS);
        if(s.noRoom){
            s.noRoom=false;
            if(s.isHidden)return;else show(pane,!s.isClosed);
        }
        if(!onInit){
            sizeContent(pane);
            execUserCallback(pane,o.onresize_end||o.onresize);
        }
    }else if(!s.noRoom){
        s.noRoom=true;
        if(s.isHidden)return;
        if(onInit){
            $P.hide();
            if($R)$R.hide();
        }else hide(pane);
    }
});
};

var sizeContent=function(panes){
    if(!panes||panes=="all")panes=c.allPanes;
    $.each(panes.split(","),function(){
        if(!$Cs[this])return;
        var
        pane=str(this),ignore=options[pane].contentIgnoreSelector,$P=$Ps[pane],$C=$Cs[pane],e_C=$C[0],height=cssH($P);
        ;
        $P.children().each(function(){
            if(this==e_C)return;
            var $E=$(this);
            if(!ignore||!$E.is(ignore))height-=$E.outerHeight();
        });
        if(height>0)height=cssH($C,height);
        if(height<1)$C.hide();else
            $C.css({
                height:height
            }).show();
    });
};

var sizeHandles=function(panes,onInit){
    if(!panes||panes=="all")panes=c.borderPanes;
    $.each(panes.split(","),function(){
        var
        pane=str(this),o=options[pane],s=state[pane],$P=$Ps[pane],$R=$Rs[pane],$T=$Ts[pane];
        if(!$P||!$R||(!o.resizable&&!o.closable))return;
        var
        dir=c[pane].dir,_state=(s.isClosed?"_closed":"_open"),spacing=o["spacing"+_state],togAlign=o["togglerAlign"+_state],togLen=o["togglerLength"+_state],paneLen,offset,CSS={};

        if(spacing==0){
            $R.hide();
            return;
        }else if(!s.noRoom&&!s.isHidden)$R.show();
        if(dir=="horz"){
            paneLen=$P.outerWidth();
            $R.css({
                width:max(1,cssW($R,paneLen)),
                height:max(1,cssH($R,spacing)),
                left:cssNum($P,"left")
                });
        }else{
            paneLen=$P.outerHeight();
            $R.css({
                height:max(1,cssH($R,paneLen)),
                width:max(1,cssW($R,spacing)),
                top:cDims.top+getPaneSize("north",true)
                });
        }
        if($T){
            if(togLen==0||(s.isSliding&&o.hideTogglerOnSlide)){
                $T.hide();
                return;
            }else
                $T.show();
            if(!(togLen>0)||togLen=="100%"||togLen>paneLen){
                togLen=paneLen;
                offset=0;
            }else{
                if(typeof togAlign=="string"){
                    switch(togAlign){
                        case"top":case"left":
                            offset=0;
                            break;
                        case"bottom":case"right":
                            offset=paneLen-togLen;
                            break;
                        case"middle":case"center":default:
                            offset=Math.floor((paneLen-togLen)/2);
                    }
                }else{
                var x=parseInt(togAlign);
                if(togAlign>=0)offset=x;else offset=paneLen-togLen+x;
            }
        }
        var
    $TC_o=(o.togglerContent_open?$T.children(".content-open"):false),$TC_c=(o.togglerContent_closed?$T.children(".content-closed"):false),$TC=(s.isClosed?$TC_c:$TC_o);
        if($TC_o)$TC_o.css("display",s.isClosed?"none":"block");
        if($TC_c)$TC_c.css("display",s.isClosed?"block":"none");
        if(dir=="horz"){
        var width=cssW($T,togLen);
        $T.css({
            width:max(0,width),
            height:max(1,cssH($T,spacing)),
            left:offset
        });
        if($TC)$TC.css("marginLeft",Math.floor((width-$TC.outerWidth())/2));
    }else{
        var height=cssH($T,togLen);
        $T.css({
            height:max(0,height),
            width:max(1,cssW($T,spacing)),
            top:offset
        });
        if($TC)$TC.css("marginTop",Math.floor((height-$TC.outerHeight())/2));
    }
    }
    if(onInit&&o.initHidden){
    $R.hide();
    if($T)$T.hide();
}
});
};

var resizeAll=function(){
    var
    oldW=cDims.innerWidth,oldH=cDims.innerHeight;
    cDims=state.container=getElemDims($Container);
    var
    checkH=(cDims.innerHeight<oldH),checkW=(cDims.innerWidth<oldW),s,dir;
    if(checkH||checkW)$.each(["south","north","east","west"],function(i,pane){
        s=state[pane];
        dir=c[pane].dir;
        if(!s.isClosed&&((checkH&&dir=="horz")||(checkW&&dir=="vert"))){
            setPaneMinMaxSizes(pane);
            if(s.size>s.maxSize)sizePane(pane,s.maxSize);
        }
    });
sizeMidPanes("all");
sizeHandles("all");
};

function keyDown(evt){
    if(!evt)return true;
    var code=evt.keyCode;
    if(code<33)return true;
    var
    PANE={
        38:"north",
        40:"south",
        37:"west",
        39:"east"
    },isCursorKey=(code>=37&&code<=40),ALT=evt.altKey,SHIFT=evt.shiftKey,CTRL=evt.ctrlKey,pane=false,s,o,k,m,el;
    if(!CTRL&&!SHIFT)return true;
    else if(isCursorKey&&options[PANE[code]].enableCursorHotkey)pane=PANE[code];else
        $.each(c.borderPanes.split(","),function(i,p){
            o=options[p];
            k=o.customHotkey;
            m=o.customHotkeyModifier;
            if((SHIFT&&m=="SHIFT")||(CTRL&&m=="CTRL")||(CTRL&&SHIFT)){
                if(k&&code==(isNaN(k)||k<=9?k.toUpperCase().charCodeAt(0):k)){
                    pane=p;
                    return false;
                }
            }
        });
if(!pane)return true;
o=options[pane];
s=state[pane];
if(!o.enableCursorHotkey||s.isHidden||!$Ps[pane])return true;
el=evt.target||evt.srcElement;
if(el&&SHIFT&&isCursorKey&&(el.tagName=="TEXTAREA"||(el.tagName=="INPUT"&&(code==37||code==39))))return true;
toggle(pane);
evt.stopPropagation();
evt.returnValue=false;
return false;
};

function allowOverflow(elem){
    if(this&&this.tagName)elem=this;
    var $P;
    if(typeof elem=="string")$P=$Ps[elem];
    else{
        if($(elem).attr("pane"))$P=$(elem);else $P=$(elem).parents("div[pane]:first");
    }
    if(!$P.length)return;
    var
    pane=$P.attr("pane"),s=state[pane];
    if(s.cssSaved)resetOverflow(pane);
    if(s.isSliding||s.isResizing||s.isClosed){
        s.cssSaved=false;
        return;
    }
    var
    newCSS={
        zIndex:(c.zIndex.pane_normal+1)
        },curCSS={},of=$P.css("overflow"),ofX=$P.css("overflowX"),ofY=$P.css("overflowY");
    if(of!="visible"){
        curCSS.overflow=of;
        newCSS.overflow="visible";
    }
    if(ofX&&ofX!="visible"&&ofX!="auto"){
        curCSS.overflowX=ofX;
        newCSS.overflowX="visible";
    }
    if(ofY&&ofY!="visible"&&ofY!="auto"){
        curCSS.overflowY=ofX;
        newCSS.overflowY="visible";
    }
    s.cssSaved=curCSS;
    $P.css(newCSS);
    $.each(c.allPanes.split(","),function(i,p){
        if(p!=pane)resetOverflow(p);
    });
};

function resetOverflow(elem){
    if(this&&this.tagName)elem=this;
    var $P;
    if(typeof elem=="string")$P=$Ps[elem];
    else{
        if($(elem).hasClass("ui-layout-pane"))$P=$(elem);else $P=$(elem).parents("div[pane]:first");
    }
    if(!$P.length)return;
    var
    pane=$P.attr("pane"),s=state[pane],CSS=s.cssSaved||{};

    if(!s.isSliding&&!s.isResizing)$P.css("zIndex",c.zIndex.pane_normal);
    $P.css(CSS);
    s.cssSaved=false;
};

function getBtn(selector,pane,action){
    var
    $E=$(selector),err="Error Adding Button \n\nInvalid ";
    if(!$E.length)alert(err+"selector: "+selector);
    else if(c.borderPanes.indexOf(pane)==-1)alert(err+"pane: "+pane);
    else{
        var btn=options[pane].buttonClass+"-"+action;
        $E.addClass(btn+" "+btn+"-"+pane);
        return $E;
    }
    return false;
};

function addToggleBtn(selector,pane){
    var $E=getBtn(selector,pane,"toggle");
    if($E)$E.attr("title",state[pane].isClosed?"Open":"Close").click(function(evt){
        toggle(pane);
        evt.stopPropagation();
    });
};

function addOpenBtn(selector,pane){
    var $E=getBtn(selector,pane,"open");
    if($E)$E.attr("title","Open").click(function(evt){
        open(pane);
        evt.stopPropagation();
    });
};

function addCloseBtn(selector,pane){
    var $E=getBtn(selector,pane,"close");
    if($E)$E.attr("title","Close").click(function(evt){
        close(pane);
        evt.stopPropagation();
    });
};

function addPinBtn(selector,pane){
    var $E=getBtn(selector,pane,"pin");
    if($E){
        var s=state[pane];
        $E.click(function(evt){
            setPinState($(this),pane,(s.isSliding||s.isClosed));
            if(s.isSliding||s.isClosed)open(pane);else close(pane);
            evt.stopPropagation();
        });
        setPinState($E,pane,(!s.isClosed&&!s.isSliding));
        c[pane].pins.push(selector);
    }
};

function syncPinBtns(pane,doPin){
    $.each(c[pane].pins,function(i,selector){
        setPinState($(selector),pane,doPin);
    });
};

function setPinState($Pin,pane,doPin){
    var updown=$Pin.attr("pin");
    if(updown&&doPin==(updown=="down"))return;
    var
    root=options[pane].buttonClass,class1=root+"-pin",class2=class1+"-"+pane,UP1=class1+"-up",UP2=class2+"-up",DN1=class1+"-down",DN2=class2+"-down";
    $Pin.attr("pin",doPin?"down":"up").attr("title",doPin?"Un-Pin":"Pin").removeClass(doPin?UP1:DN1).removeClass(doPin?UP2:DN2).addClass(doPin?DN1:UP1).addClass(doPin?DN2:UP2);
};

var
$Container=$(this).css({
    overflow:"hidden"
}),$Ps={},$Cs={},$Rs={},$Ts={},c=config,cDims=state.container;
create();
return{
    options:options,
    state:state,
    panes:$Ps,
    toggle:toggle,
    open:open,
    close:close,
    hide:hide,
    show:show,
    resizeContent:sizeContent,
    sizePane:sizePane,
    resizeAll:resizeAll,
    addToggleBtn:addToggleBtn,
    addOpenBtn:addOpenBtn,
    addCloseBtn:addCloseBtn,
    addPinBtn:addPinBtn,
    allowOverflow:allowOverflow,
    resetOverflow:resetOverflow,
    cssWidth:cssW,
    cssHeight:cssH
};

}
})(jQuery);