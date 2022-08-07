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

    @NotEmpty(message = "Background is Required")
    private String background;

    @NotEmpty(message = "Logo is Required")
    @NotNull(message = "Logo can not be null")
    @Column(length = 400)
    private String brandLogo;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd:hh:mm:ss")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd:hh:mm:ss")
    private Date updatedAt;

    /*---- Relations ----*/
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

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

    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public String getBrandLogo() {
        return brandLogo;
    }

    public void setBrandLogo(String brandLogo) {
        this.brandLogo = brandLogo;
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




}
