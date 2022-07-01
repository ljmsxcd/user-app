<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<script type="text/javascript" src="../lib/element/vue.js"></script>
<script type="text/javascript" src="../lib/element/index.js"></script>
<script type="text/javascript" src="../lib/element/axios.js"></script>
<link rel="stylesheet" type="text/css" href="../lib/element/index.css">
<style>
.jqx-tabs-content .jqx-tabs-content-element {
	overflow:hidden;
}
</style>
<script>
	!function(t,e){"object"==typeof module&&module.exports?(module.exports=e(),module.exports.default=module.exports):t.__punch=e()}("undefined"!=typeof window?window:this,function(){function t(t){return Object.assign({width:250,height:80,bg:"transparent",bgAlpha:.8,color:"#ebebeb",alpha:.65,font:"14px Arial"},t||{})}"function"!=typeof Object.assign&&Object.defineProperty(Object,"assign",{value:function(t,e){if(null==t)throw new TypeError("Cannot convert undefined or null to object");for(var o=Object(t),n=1;n<arguments.length;n++){var l=arguments[n];if(null!=l)for(var r in l)Object.prototype.hasOwnProperty.call(l,r)&&(o[r]=l[r])}return o},writable:!0,configurable:!0});var e,o,n=function(n,l){if(!(e&&o||("undefined"!=typeof document&&(e=document.createElement("canvas")),o=e&&e.getContext&&e.getContext("2d"),e&&o)))return"";l=t(l);var r=l.width,a=l.height;return e.width=r,e.height=a,o.clearRect(0,0,r,a),o.globalAlpha=l.bgAlpha,o.fillStyle=l.bg,o.fillRect(0,0,r,a),o.globalAlpha=l.alpha,o.fillStyle=l.color,o.font=l.font,o.textAlign="left",o.textBaseline="bottom",o.translate(.1*r,.2*a),o.rotate(Math.PI/10),o.fillText(n,0,0),e.toDataURL()};return n.to=function(t,e,o){var l=arguments.length;l&&(1==l&&(e=t,t=document.body,o={}),2==l&&(o=e,e=t,t=document.body),t.style.background="url("+n(e,o)+")")},n});

	setTimeout(function(){
		let bg=document.body.style.background;
		let el=document.createElement('div');
		el.style.background=bg;
		el.style.zIndex='999';
		el.style.position='fixed';
		el.style.pointerEvents='none';
		el.style.width='100%';
		el.style.height='100%';
		el.style.top='0px';
		document.body.appendChild(el);
	},500);
</script>
