package com.propertypro.model.property;



public class Property {
	
	
	
    private String id;
    private String title;
    private String description;
    private String type;
    private String price;
    private String bedrooms;
    private String bathrooms;
    private String areaSqft;
    private String location;
    private String status;
    private String userId;
    private String imagePath;
    
    
    //constructor with details
	public Property(String id, String title, String description, String type, String price, String bedrooms,
			String bathrooms, String areaSqft, String location, String status, String userId,  String imagePath) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.type = type;
		this.price = price;
		this.bedrooms = bedrooms;
		this.bathrooms = bathrooms;
		this.areaSqft = areaSqft;
		this.location = location;
		this.status = status;
		this.userId = userId;
		this.imagePath = imagePath;
		
	}
	
	//get id
	public String getId() {
		return id;
	}
	
	//set id
	public void setId(String id) {
		this.id = id;
	}
	
	//get title
	public String getTitle() {
		return title;
	}
	
	//set title
	public void setTitle(String title) {
		this.title = title;
	}
	
	//get description
	public String getDescription() {
		return description;
	}
	
	//set description
	public void setDescription(String description) {
		this.description = description;
	}
	
	//get property type
	public String getType() {
		return type;
	}

	//set property type
	public void setType(String type) {
		this.type = type;
	}
	
	//get price
	public String getPrice() {
		return price;
	}
	
	//set price
	public void setPrice(String price) {
		this.price = price;
	}
	
	//get bedrooms details
	public String getBedrooms() {
		return bedrooms;
	}
	
	//set bedrooms details
	public void setBedrooms(String bedrooms) {
		this.bedrooms = bedrooms;
	}
	
	//get bathrooms details
	public String getBathrooms() {
		return bathrooms;
	}
	
	//set bathrooms details
	public void setBathrooms(String bathrooms) {
		this.bathrooms = bathrooms;
	}
	
	//get Area
	public String getAreaSqft() {
		return areaSqft;
	}
	
	//set Area
	public void setAreaSqft(String areaSqft) {
		this.areaSqft = areaSqft;
	}
	
	//get location
	public String getLocation() {
		return location;
	}
	
	//set location
	public void setLocation(String location) {
		this.location = location;
	}
	
	//get status
	public String getStatus() {
		return status;
	}
	
	//set status
	public void setStatus(String status) {
		this.status = status;
	}
	
	//get userID
	public String getUserId() {
		return userId;
	}
	
	//set userID
	public void setUserId(String userId) {
		this.userId = userId;
	}

	//get Image
	public String getImagePath() {
        return imagePath;
    }
	
	
	//set Image
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
	
	
	
	
    
    

    
    
}

