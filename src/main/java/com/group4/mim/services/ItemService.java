package com.group4.mim.services;

import com.group4.mim.models.Item;
import com.group4.mim.repositories.ItemRepository;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class ItemService {

    private final ItemRepository itemRepository;
    private final HttpServletRequest request;

    public ItemService(ItemRepository itemRepository, HttpServletRequest request) {
        this.itemRepository = itemRepository;
        this.request = request;
    }

    public void createItem(Item item){
        itemRepository.save(item);
    }

    public void deleteItem(long id){
        Optional<Item> item = itemRepository.findById(id);
        if(item.isPresent()){
            itemRepository.delete(item.get());
        }
    }


    public void updateItem(Item i,long id){
    Optional<Item> item = itemRepository.findById(id);
    if(item.isPresent()){
        item.get().setImage(i.getImage());
        item.get().setDescription_ar(i.getDescription_ar());
        item.get().setDescription_en(i.getDescription_en());
        item.get().setPrice(i.getPrice());
        item.get().setName_ar(i.getName_ar());
        item.get().setName_en(i.getName_en());
        item.get().setPromo_ar(i.getPromo_ar());
        item.get().setPromo_en(i.getPromo_en());
        item.get().setDiscountPrice(i.getDiscountPrice());
        itemRepository.save(i);
        }
    }

    public Item findItem(long id){
        Optional<Item> item = itemRepository.findById(id);
        if(item.isPresent()){
            return item.get();
        }else{
            return null;
        }
    }

    public String uploadImage(MultipartFile multipartFile){
        if(multipartFile.isEmpty()){
            return null;
        }else{
            try {

                String path = request.getServletContext().getRealPath("/resources/static/uploads/items/");
                String date = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss").format(new Date());
                String random = RandomStringUtils.random(10,true,false);
                String filename = date + random + ".jpg";
                String databasefilename = String.format("uploads/items/%s",filename);
                String filePath = path + filename;
                multipartFile.transferTo(new File(filePath));
                return databasefilename;
            }catch (Exception e){
                return null;
            }
        }
    }

    public long countAll(long user_id){
        return itemRepository.countAllItems(user_id);
    }

    public List<Item> findAllItemsForUser(long user_id){
        return itemRepository.findAllItemsForUser(user_id);
    }
}
