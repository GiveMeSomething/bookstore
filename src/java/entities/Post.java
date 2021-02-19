/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author Admin
 */
public class Post {

    private String postTitle;
    private int upvote;
    private int bookId;
    private String postContent;

    public Post() {
    }

    public Post(String postTitle, int upvote, int bookId, String postContent) {
        this.postTitle = postTitle;
        this.upvote = upvote;
        this.bookId = bookId;
        this.postContent = postContent;
    }

}
