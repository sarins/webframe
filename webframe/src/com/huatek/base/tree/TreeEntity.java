package com.huatek.base.tree;

import java.util.List;
import java.util.Vector;

import com.huatek.base.entity.NamedEntity;

public class TreeEntity extends NamedEntity implements java.io.Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private TreeEntity parent;
	private Integer level;

	public TreeEntity getParent() {
		return parent;
	}

	public void setParent(TreeEntity parent) {
		this.parent = parent;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	private String style;
	private String nodeLabel;

	public String getNodeLabel() {
		return nodeLabel;
	}

	public void setNodeLabel(String nodeLabel) {
		this.nodeLabel = nodeLabel;
	}

	public String getTabString() {
		StringBuffer returnStr = new StringBuffer("&nbsp;&nbsp;");
		int i = 0;
		while (i < this.level - 1) {
			returnStr.append("&nbsp;&nbsp;");
			i++;
		}
		return returnStr.toString();
	}

	public String getTabName(){
		return this.getTabString()+this.getName();
	}

	String classStyle;
	String imagePath;
	String target;
	boolean isContainChild;
	boolean isLastChild;
	String link;
	String title;
	boolean isEdit;
	public boolean isEdit() {
		return isEdit;
	}

	public void setEdit(boolean isEdit) {
		this.isEdit = isEdit;
	}

	public String getClassStyle() {
		return classStyle;
	}

	public void setClassStyle(String classStyle) {
		this.classStyle = classStyle;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public boolean isContainChild() {
		return isContainChild;
	}

	public void setContainChild(boolean isContainChild) {
		this.isContainChild = isContainChild;
	}

	public boolean isLastChild() {
		return isLastChild;
	}

	public void setLastChild(boolean isLastChild) {
		this.isLastChild = isLastChild;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAlt() {
		return alt;
	}

	public void setAlt(String alt) {
		this.alt = alt;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public TreeEntity getNextNode() {
		return nextNode;
	}

	public void setNextNode(TreeEntity nextNode) {
		this.nextNode = nextNode;
	}
	public String getTreePrefixCode(){
		return getStyle().substring(0,getLevel()*2);
	}

	String alt;
	String icon;
	TreeEntity nextNode;
	public String getIconTreeNodeString(){
		String html = "<li><img src='"+imagePath+"plus.gif' class='"+classStyle+"' alt='"+JavaScriptEncoder.INSTANCE.encode(this.getTitle())+"'><a"+
		" id='"+super.getId()+"' title='"+JavaScriptEncoder.INSTANCE.encode(this.getTitle())+"' href='"+link+"'"+(target==null?"":" target='"+target+"'")+"><img src='"+imagePath+icon+"' alt='"+JavaScriptEncoder.INSTANCE.encode(this.getAlt())+"'>"+HTMLEncoder.INSTANCE.encode(this.getNodeLabel())+"</a>";
		return getNodeEndFlag(html);

	}
	public String getTreeNodeString(){
		String editFlagHtml = "";
		if(!isEdit){
			 editFlagHtml = " noDrag=\"true\" noSiblings=\"true\" noDelete=\"true\" noRename=\"true\"";
		}
		String html = "<li id=\"node"+this.getId()+"\" "+editFlagHtml+" ><a id='"+super.getId()+"' title='"+JavaScriptEncoder.INSTANCE.encode(this.getTitle())+"' href='"+link+"'"+(target==null?"":" target='"+target+"'")+">"+HTMLEncoder.INSTANCE.encode(this.getNodeLabel())+"</a>";
		return getNodeEndFlag(html);

	}

	public String getStandardTreeNodeString(){
        String html = "<li><a id='"+super.getId()+"' title='"+JavaScriptEncoder.INSTANCE.encode(this.getTitle())+"' href='"+link+"'"+(target==null?"":" target='"+target+"'")+">"+HTMLEncoder.INSTANCE.encode(this.getNodeLabel());
        return getStandardNodeEndFlag(html);

    }

	private String getNodeEndFlag(String html) {
		StringBuffer  htmlBuffer = new StringBuffer(html);
		if(isContainChild){
			htmlBuffer.append("\n<ul class='"+classStyle+"'>");
			return htmlBuffer.toString();
		}else{
			htmlBuffer.append("</li>");
			if(isLastChild){
				if(nextNode==null){
					TreeEntity parentNode = getParent();
					while(parentNode !=null){
						htmlBuffer.append("\n</ul></li>");
						parentNode = parentNode.getParent();
					}
				}else{
					TreeEntity nextNodeParent = nextNode.getParent();
					TreeEntity parentNode = getParent();
					while(parentNode!=null&&parentNode!=nextNodeParent){
						htmlBuffer.append("\n</ul></li>");
						parentNode = parentNode.getParent();
					}
				}
			}
			return htmlBuffer.toString();
		}
	}
	private String getStandardNodeEndFlag(String html) {
		StringBuffer  htmlBuffer = new StringBuffer(html);
        if(isContainChild){
        	htmlBuffer.append("<!--[if IE 7]><!--></a><!--<![endif]-->\n");
        	htmlBuffer.append("<!--[if lte IE 6]><table><tr><td><![endif]-->\n<ul>");
            return htmlBuffer.toString();
        }else{
        	htmlBuffer.append("</a></li>");
            if(isLastChild){
                if(nextNode==null){
                    TreeEntity parentNode = getParent();
                    while(parentNode !=null){
                    	htmlBuffer.append("\n</ul>\n<!--[if lte IE 6]></td></tr></table></a><![endif]-->\n</li>");
                        parentNode = parentNode.getParent();
                    }
                }else{
                    TreeEntity nextNodeParent = nextNode.getParent();
                    TreeEntity parentNode = getParent();
                    while(parentNode!=null&&parentNode!=nextNodeParent){
                    	htmlBuffer.append("\n</ul>\n<!--[if lte IE 6]></td></tr></table></a><![endif]-->\n</li>");
                        parentNode = parentNode.getParent();
                    }
                }
            }
            return htmlBuffer.toString();
        }
    }
	public static void generalTreeNode(boolean isEdit, String imagePath,String target, List<? extends TreeEntity> list) {
		int size = list.size();
		Vector<TreeEntity> parentVector = new Vector<TreeEntity>();
		 if(size>0){
			parentVector.add(TreeUtil.getDefaultRootNode());
		}
		for(int i=0;i<size;i++){
			TreeEntity node = list.get(i);
			node.setContainChild(i+1<size&&list.get(i+1).getParent()==node);
			node.setTarget(target);
			node.setEdit(isEdit);
			if(node.isContainChild()){
				//node.setIcon("container_obj.gif");
				node.setClassStyle("collapsed");
				parentVector.add(list.get(i));
			}else{
				//node.setIcon("topic.gif");
				node.setClassStyle("nochild");
			}
			node.setImagePath(imagePath);
			//node.setLink("javascript:showTopicContent("+node.getId()+");");
			if(i+1==size){
				node.setLastChild(true);
			}
			if(i>0){
				list.get(i-1).setNextNode(node);
				if(node.getLevel()<list.get(i-1).getLevel()){
					list.get(i-1).setLastChild(true);
					while(parentVector.size()>1){
						TreeEntity parent = parentVector.get(parentVector.size() - 1);
						TreeEntity nodeParent = node.getParent();
						if(nodeParent==null){
							nodeParent = parentVector.get(0);
						}
						if(parent.getLevel()>nodeParent.getLevel()){
							parent.setLastChild(true);
							parentVector.remove(parentVector.size() - 1);
						}else{
							break;
						}

					}
				}else if(node.getLevel().intValue()==list.get(i-1).getLevel().intValue()){
					list.get(i-1).setLastChild(false);
				}
			}
		}
	}
}
