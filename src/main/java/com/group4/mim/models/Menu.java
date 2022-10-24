package com.group4.mim.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "menus")
public class Menu {

    public Menu() {
    }


    @Id
    @GeneratedValue
    private long id;

    @NotEmpty(message = "Brand Name in Arabic cannot be Empty")
    @Size(min = 2 , max = 64 , message = "Brand name must be at least 2 characters")
    private String brandName_ar;

    @NotEmpty(message = "Brand Name in English cannot be Empty")
    @Size(min = 2 , max = 64 , message = "Brand name must be at least 2 characters")
    private String brandName_en;


    @Lob
    private String brandLogo_path;

    @Lob
    private byte[] brandLogo;

    @Lob
    private String background_path;

    @Lob
    private byte[] background;


    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd:hh:mm:ss")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd:hh:mm:ss")
    private Date updatedAt;

    /*---- Relations ----*/
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "menu",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private List<Item> items;

    @OneToMany(mappedBy = "menu",fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Category> categories;

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

    public String getBrandName_ar() {
        return brandName_ar;
    }

    public void setBrandName_ar(String brandName_ar) {
        this.brandName_ar = brandName_ar;
    }

    public String getBrandName_en() {
        return brandName_en;
    }

    public void setBrandName_en(String brandName_en) {
        this.brandName_en = brandName_en;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public String getBrandLogo_path() {
        return brandLogo_path;
    }

    public void setBrandLogo_path(String brandLogo_path) {
        this.brandLogo_path = brandLogo_path;
    }

    public byte[] getBrandLogo() {
        return brandLogo;
    }

    public void setBrandLogo(byte[] brandLogo) {
        this.brandLogo = brandLogo;
    }

    public String getBackground_path() {
        return background_path;
    }

    public void setBackground_path(String background_path) {
        this.background_path = background_path;
    }

    public byte[] getBackground() {
        return background;
    }

    public void setBackground(byte[] background) {
        this.background = background;
    }
}
