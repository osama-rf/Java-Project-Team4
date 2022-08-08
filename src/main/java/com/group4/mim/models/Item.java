package com.group4.mim.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "items")
public class Item {

    public Item() {
    }

    public Item(String name_en, String name_ar, String description_en, String description_ar,
                double price, double discountPrice, String promo_ar, String promo_en, String image, User user, Category category){
        this.name_en=name_en;
        this.name_ar=name_ar;
        this.description_en=description_en;
        this.description_ar=description_ar;
        this.price=price;
        this.discountPrice=discountPrice;
        this.promo_ar=promo_ar;
        this.promo_en=promo_en;
        this.image=image;
        this.user=user;
        this.category=category;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty(message = "Name is required")
    private String name_en;

    @NotEmpty(message = "Name is required")
    private String name_ar;

    @Column(length = 3000 , nullable = true)
    private String description_en;

    @Column(length = 3000 , nullable = true)
    private String description_ar;

    @NotEmpty(message = "Price is required")
    private double price;

    @Column(nullable = true)
    private double discountPrice;

    @Column(nullable = true)
    private String promo_en;
    @Column(nullable = true)
    private String promo_ar;

    @NotEmpty(message = "Image is required")
    private String image;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd:hh:mm:ss")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd:hh:mm:ss")
    private Date updatedAt;

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

    /*---- Relations ----*/
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "categories_items",
            joinColumns = @JoinColumn(name = "item_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id")
    )
    private List<Category> categories;
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name="reviews",
            joinColumns = @JoinColumn(name = "item_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> users;

    public String getName_en() {
        return name_en;
    }

    public void setName_en(String name_en) {
        this.name_en = name_en;
    }

    public String getName_ar() {
        return name_ar;
    }

    public void setName_ar(String name_ar) {
        this.name_ar = name_ar;
    }

    public String getDescription_en() {
        return description_en;
    }

    public void setDescription_en(String description_en) {
        this.description_en = description_en;
    }

    public String getDescription_ar() {
        return description_ar;
    }

    public void setDescription_ar(String description_ar) {
        this.description_ar = description_ar;
    }

    public String getPromo_en() {
        return promo_en;
    }

    public void setPromo_en(String promo_en) {
        this.promo_en = promo_en;
    }

    public String getPromo_ar() {
        return promo_ar;
    }

    public void setPromo_ar(String promo_ar) {
        this.promo_ar = promo_ar;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public long getId() {
        return id;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
