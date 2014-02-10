package org.wdcode.core.json;

import java.util.List;
import java.util.Map;

import org.wdcode.common.constants.StringConstants;
import org.wdcode.common.lang.Lists;
import org.wdcode.common.lang.Maps;
import org.wdcode.common.util.BeanUtil;
import org.wdcode.common.util.EmptyUtil;
import org.wdcode.core.factory.FactoryKey;
import org.wdcode.core.json.impl.JsonFast;
import org.wdcode.core.json.impl.JsonGson;
import org.wdcode.core.json.impl.JsonLib;
import org.wdcode.core.json.impl.JsonSmart;
import org.wdcode.core.params.JsonParams;

/**
 * JSON处理引擎
 * @author WD
 * @since JDK7
 * @version 1.0 2012-06-24
 */
public final class JsonEngine extends FactoryKey<String, Json> {
	// 工厂
	private final static JsonEngine	FACTORY	= new JsonEngine();
	// 默认Json解析
	private final static Json		JSON	= getJson(JsonParams.PARSE);

	/**
	 * 是否是json串
	 * @param json json串
	 * @return true false
	 */
	public static boolean isJson(String json) {
		// 字符串为空
		if (EmptyUtil.isEmpty(json)) {
			return false;
		}
		// 是数组格式
		if (isObject(json)) {
			return true;
		}
		// 是数组格式
		if (isArray(json)) {
			return true;
		}
		// 返回false
		return false;
	}

	/**
	 * 是否是json普通对象格式
	 * @param json json串
	 * @return true false
	 */
	public static boolean isObject(String json) {
		// 字符串为空
		if (EmptyUtil.isEmpty(json)) {
			return false;
		}
		// {开头 }结尾
		if (json.startsWith("{") && json.endsWith("}")) {
			return true;
		}
		// 空json
		if (json.equals("{}")) {
			return true;
		}
		// 返回false
		return false;
	}

	/**
	 * 是否是json数组格式
	 * @param json json串
	 * @return true false
	 */
	public static boolean isArray(String json) {
		// 字符串为空
		if (EmptyUtil.isEmpty(json)) {
			return false;
		}
		// [开头 ]结尾
		if (json.startsWith("[{") && json.endsWith("}]")) {
			return true;
		}
		// 空json
		if (json.equals("[]")) {
			return true;
		}
		// 返回false
		return false;
	}

	/**
	 * 把一个对象转换成JSON
	 * @param obj 要转换的对象
	 * @return 转换后的字符串
	 */
	public static String toJson(Object obj) {
		return obj == null ? StringConstants.EMPTY : JSON.toJson(obj);
	}

	/**
	 * 转换JSON根据传入的Class反射生成回实体Bean
	 * @param json JSON字符串
	 * @param clazz 要转换对象的class
	 * @return 对象
	 */
	public static <E> E toBean(String json, Class<E> clazz) {
		return EmptyUtil.isEmpty(json) ? null : JSON.toBean(json, clazz);
	}

	/**
	 * 把json转换成List
	 * @param json JSON字符串
	 * @return List
	 */
	public static <E> List<E> toList(String json, Class<E> clazz) {
		return EmptyUtil.isEmpty(json) ? (List<E>) Lists.getList() : JSON.toList(json, clazz);
	}

	/**
	 * 把json转换成Map
	 * @param json JSON字符串
	 * @return Map
	 */
	public static Map<String, Object> toMap(String json) {
		return toBean(json, Map.class);
	}

	/**
	 * 把json转换成Map
	 * @param json JSON字符串
	 * @param value Map值类
	 * @return Map
	 */
	public static <E> Map<String, E> toMap(String json, Class<E> value) {
		// 获得Map
		Map<String, Object> map = toBean(json, Map.class);
		// 声明返回map
		Map<String, E> data = Maps.getMap(map.size());
		// 循环生成类
		for (Map.Entry<String, Object> e : map.entrySet()) {
			data.put(e.getKey(), BeanUtil.copyProperties(e.getValue(), value));
		}
		// 返回数据
		return data;
	}

	/**
	 * 把json转换成List
	 * @param json JSON字符串
	 * @return List
	 */
	public static List<Object> toList(String json) {
		return toList(json, Object.class);
	}

	/**
	 * 根据key获得相应json解析类
	 * @param key fast=fastjson lib=json-lib smart=json-smart gson=gson
	 * @return Json
	 */
	public static Json getJson(String key) {
		return FACTORY.getInstance(key);
	}

	@Override
	public Json newInstance(String key) {
		switch (key) {
			case JsonParams.PARSE_FAST:
				return new JsonFast();
			case JsonParams.PARSE_LIB:
				return new JsonLib();
			case JsonParams.PARSE_SMART:
				return new JsonSmart();
			default:
				return new JsonGson();
		}
	}

	/**
	 * 私有构造
	 */
	private JsonEngine() {}
}
