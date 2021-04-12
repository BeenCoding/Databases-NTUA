package packedup;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Information {
	
	private LinkedHashMap<String,String> hotPairs = new LinkedHashMap<String,String>();
	private LinkedHashMap<Integer,List<Integer>> hotPos = new LinkedHashMap<Integer,List<Integer>>();
	private Map<String,Float> percBrand = new HashMap<String, Float>();
	private LinkedHashMap<Integer, Float> revenuePerHour = new LinkedHashMap<Integer, Float>();
	private LinkedHashMap<Integer, List<Float>> elderlyGroups = new LinkedHashMap<Integer, List<Float>>();
	private LinkedHashMap<Integer, List<Float>> customQuery1 = new LinkedHashMap<Integer, List<Float>>();
	private LinkedHashMap<String, Float> customQuery2 = new LinkedHashMap<String, Float>();

	public Information (Map<String, Float> percBrand,LinkedHashMap<Integer,Float> revenuePerHour,LinkedHashMap<Integer,List<Float>> elderlyGroups,LinkedHashMap<String,String> hotPairs
			,LinkedHashMap<Integer,List<Integer>> hotPos, LinkedHashMap<Integer, List<Float>> customQuery1,LinkedHashMap<String, Float> customQuery2) {
		this.percBrand = percBrand;
		this.revenuePerHour = revenuePerHour;
		this.elderlyGroups = elderlyGroups;
		this.hotPairs = hotPairs;
		this.hotPos = hotPos;
		this.customQuery1 = customQuery1;
		this.customQuery2 = customQuery2;
	}
	
	public Map<String, Float> getPercBrand() {
		return percBrand;
	}
	
	public LinkedHashMap<Integer,Float> getRevenuePerHour() {
		return revenuePerHour;
	}
	
	public LinkedHashMap<Integer, List<Float>> getElderlyGroups() {
		return elderlyGroups;
	}

	public LinkedHashMap<String, String> getHotPairs() {
		return hotPairs;
	}
	
	public LinkedHashMap<Integer,List<Integer>> getHotPos() {
		return hotPos;
	}
	
	public LinkedHashMap<Integer, List<Float>> getSpendBasedOnPetAndFam() {
		return customQuery1;
	}
	
	public LinkedHashMap<String,Float> getSpendOnAlcho() {
		return customQuery2;
	}
	
}
