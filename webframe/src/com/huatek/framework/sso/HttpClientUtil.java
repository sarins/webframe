package com.huatek.framework.sso;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.service.GlobalVar;

public class HttpClientUtil {
	/**
	 * 日志常量.
	 * **/
	private static final Logger LOGGER = Logger
			.getLogger(HttpClientUtil.class);
	/***
	 * GSON 操作常量.
	 */
	public static final Gson GSON = new GsonBuilder().setDateFormat(
			"yyyy-MM-dd HH:mm:ss").create();

	/***
	 * 协议版本.
	 */
	public static final String VERSION = "1.0";
	public static String getMethod(String url, String jsessionId) throws Exception  {
		DefaultHttpClient httpclient = new DefaultHttpClient();
		//请求超时
		httpclient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 60000);
		//读取超时
		httpclient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 60000);
		HttpGet httpget = new HttpGet(url);
		if(jsessionId!=null){
			httpget.setHeader("Cookie", "JSESSIONID="+jsessionId);
		}
        try {
            return httpclient.execute(httpget, new BasicResponseHandler());
        } finally {
        	httpclient.getConnectionManager().shutdown();
        }
	}

	public static String postMethod(String url, List<NameValuePair> data,String jsessionId) throws Exception {
		DefaultHttpClient httpclient = new DefaultHttpClient();
		//请求超时
		httpclient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 60000);
		//读取超时
		httpclient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 60000);
		HttpPost httpost = new HttpPost(url);
		if(jsessionId!=null){
			httpost.setHeader("Cookie", "JSESSIONID="+jsessionId);
		}
		if(data!=null){
			httpost.setEntity(new UrlEncodedFormEntity(data, HTTP.UTF_8));
		}
		try{
			HttpResponse response = httpclient.execute(httpost);
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				return EntityUtils.toString(entity);
			}
			return null;
		}finally {
			httpclient.getConnectionManager().shutdown();
		}
	}

	public static String trimJSONSata(String data){
		if(data.indexOf("{")<0||data.indexOf("}")<0){
			return data;
		}
		if(data.startsWith("{")&&data.endsWith("}")){
			return data;
		}
		return data.substring(data.indexOf("{")-1, data.lastIndexOf("}")+1);
	}

	public static String serializableEntity(Object obj) throws IOException{
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
        objectOutputStream.writeObject(obj);
        String serStr = byteArrayOutputStream.toString("ISO-8859-1");
        serStr = java.net.URLEncoder.encode(serStr, GlobalVar.CHARSET_UTF_8);

        objectOutputStream.close();
        byteArrayOutputStream.close();
        return serStr;
	}

	public static Object unSerializeableEntity(String objString) throws IOException, ClassNotFoundException{
		String redStr = java.net.URLDecoder.decode(objString, GlobalVar.CHARSET_UTF_8);
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(redStr.getBytes("ISO-8859-1"));
        ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
        objectInputStream.close();
        byteArrayInputStream.close();
        return objectInputStream.readObject();
	}

	/*public static void main(String args[]) throws IOException, ClassNotFoundException{
		FwAccount account = new FwAccount();
		account.setAcctName("winner");
		String redStr = serializableEntity(account);
		System.out.println(redStr);
		FwAccount myAccount = (FwAccount)unSerializeableEntity(redStr);
		System.out.println(myAccount.getAcctName());
	}*/

}


