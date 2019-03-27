//package io.flutter.plugins;
//
//import org.json.JSONException;
//import org.json.JSONObject;
//
//import java.lang.reflect.Type;
//import java.util.ArrayList;
//import java.util.List;
//
//public class test {
//
//    /**
//     * data : {"SjDailyPicDtoList":[{"imageDate":"2019-01-18","imageId":"19011814080005467","imageName":"【每日一图】长光卫星前往拍摄伊朗的山城纳坦兹","style":"1","thumbnail1FilePath":"http://202.111.178.10:28085/upload/image/201901181408000044766_thumb.jpeg","thumbnail2FilePath":"","thumbnail3FilePath":""}],"pages":563,"count":563}
//     * message : success
//     * status : 200
//     */
//
//    private DataBean data;
//    private String message;
//    private int status;
//
//    public static test objectFromData(String str) {
//
//        return new com.google.gson.Gson().fromJson(str, test.class);
//    }
//
//    public static test objectFromData(String str, String key) {
//
//        try {
//            JSONObject jsonObject = new JSONObject(str);
//
//            return new com.google.gson.Gson().fromJson(jsonObject.getString(str), test.class);
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//
//        return null;
//    }
//
//    public static List<test> arraytestFromData(String str) {
//
//        Type listType = new com.google.gson.reflect.TypeToken<ArrayList<test>>() {
//        }.getType();
//
//        return new com.google.gson.Gson().fromJson(str, listType);
//    }
//
//    public static List<test> arraytestFromData(String str, String key) {
//
//        try {
//            JSONObject jsonObject = new JSONObject(str);
//            Type listType = new com.google.gson.reflect.TypeToken<ArrayList<test>>() {
//            }.getType();
//
//            return new com.google.gson.Gson().fromJson(jsonObject.getString(str), listType);
//
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }
//
//        return new ArrayList();
//
//
//    }
//
//    public DataBean getData() {
//        return data;
//    }
//
//    public void setData(DataBean data) {
//        this.data = data;
//    }
//
//    public String getMessage() {
//        return message;
//    }
//
//    public void setMessage(String message) {
//        this.message = message;
//    }
//
//    public int getStatus() {
//        return status;
//    }
//
//    public void setStatus(int status) {
//        this.status = status;
//    }
//
//    public static class DataBean {
//        /**
//         * SjDailyPicDtoList : [{"imageDate":"2019-01-18","imageId":"19011814080005467","imageName":"【每日一图】长光卫星前往拍摄伊朗的山城纳坦兹","style":"1","thumbnail1FilePath":"http://202.111.178.10:28085/upload/image/201901181408000044766_thumb.jpeg","thumbnail2FilePath":"","thumbnail3FilePath":""}]
//         * pages : 563
//         * count : 563
//         */
//
//        private int pages;
//        private int count;
//        private List<SjDailyPicDtoListBean> SjDailyPicDtoList;
//
//        public static DataBean objectFromData(String str) {
//
//            return new com.google.gson.Gson().fromJson(str, DataBean.class);
//        }
//
//        public static DataBean objectFromData(String str, String key) {
//
//            try {
//                JSONObject jsonObject = new JSONObject(str);
//
//                return new com.google.gson.Gson().fromJson(jsonObject.getString(str), DataBean.class);
//            } catch (JSONException e) {
//                e.printStackTrace();
//            }
//
//            return null;
//        }
//
//        public static List<DataBean> arrayDataBeanFromData(String str) {
//
//            Type listType = new com.google.gson.reflect.TypeToken<ArrayList<DataBean>>() {
//            }.getType();
//
//            return new com.google.gson.Gson().fromJson(str, listType);
//        }
//
//        public static List<DataBean> arrayDataBeanFromData(String str, String key) {
//
//            try {
//                JSONObject jsonObject = new JSONObject(str);
//                Type listType = new com.google.gson.reflect.TypeToken<ArrayList<DataBean>>() {
//                }.getType();
//
//                return new com.google.gson.Gson().fromJson(jsonObject.getString(str), listType);
//
//            } catch (JSONException e) {
//                e.printStackTrace();
//            }
//
//            return new ArrayList();
//
//
//        }
//
//        public int getPages() {
//            return pages;
//        }
//
//        public void setPages(int pages) {
//            this.pages = pages;
//        }
//
//        public int getCount() {
//            return count;
//        }
//
//        public void setCount(int count) {
//            this.count = count;
//        }
//
//        public List<SjDailyPicDtoListBean> getSjDailyPicDtoList() {
//            return SjDailyPicDtoList;
//        }
//
//        public void setSjDailyPicDtoList(List<SjDailyPicDtoListBean> SjDailyPicDtoList) {
//            this.SjDailyPicDtoList = SjDailyPicDtoList;
//        }
//
//        public static class SjDailyPicDtoListBean {
//            /**
//             * imageDate : 2019-01-18
//             * imageId : 19011814080005467
//             * imageName : 【每日一图】长光卫星前往拍摄伊朗的山城纳坦兹
//             * style : 1
//             * thumbnail1FilePath : http://202.111.178.10:28085/upload/image/201901181408000044766_thumb.jpeg
//             * thumbnail2FilePath :
//             * thumbnail3FilePath :
//             */
//
//            private String imageDate;
//            private String imageId;
//            private String imageName;
//            private String style;
//            private String thumbnail1FilePath;
//            private String thumbnail2FilePath;
//            private String thumbnail3FilePath;
//
//            public static SjDailyPicDtoListBean objectFromData(String str) {
//
//                return new com.google.gson.Gson().fromJson(str, SjDailyPicDtoListBean.class);
//            }
//
//            public static SjDailyPicDtoListBean objectFromData(String str, String key) {
//
//                try {
//                    JSONObject jsonObject = new JSONObject(str);
//
//                    return new com.google.gson.Gson().fromJson(jsonObject.getString(str), SjDailyPicDtoListBean.class);
//                } catch (JSONException e) {
//                    e.printStackTrace();
//                }
//
//                return null;
//            }
//
//            public static List<SjDailyPicDtoListBean> arraySjDailyPicDtoListBeanFromData(String str) {
//
//                Type listType = new com.google.gson.reflect.TypeToken<ArrayList<SjDailyPicDtoListBean>>() {
//                }.getType();
//
//                return new com.google.gson.Gson().fromJson(str, listType);
//            }
//
//            public static List<SjDailyPicDtoListBean> arraySjDailyPicDtoListBeanFromData(String str, String key) {
//
//                try {
//                    JSONObject jsonObject = new JSONObject(str);
//                    Type listType = new com.google.gson.reflect.TypeToken<ArrayList<SjDailyPicDtoListBean>>() {
//                    }.getType();
//
//                    return new com.google.gson.Gson().fromJson(jsonObject.getString(str), listType);
//
//                } catch (JSONException e) {
//                    e.printStackTrace();
//                }
//
//                return new ArrayList();
//
//
//            }
//
//            public String getImageDate() {
//                return imageDate;
//            }
//
//            public void setImageDate(String imageDate) {
//                this.imageDate = imageDate;
//            }
//
//            public String getImageId() {
//                return imageId;
//            }
//
//            public void setImageId(String imageId) {
//                this.imageId = imageId;
//            }
//
//            public String getImageName() {
//                return imageName;
//            }
//
//            public void setImageName(String imageName) {
//                this.imageName = imageName;
//            }
//
//            public String getStyle() {
//                return style;
//            }
//
//            public void setStyle(String style) {
//                this.style = style;
//            }
//
//            public String getThumbnail1FilePath() {
//                return thumbnail1FilePath;
//            }
//
//            public void setThumbnail1FilePath(String thumbnail1FilePath) {
//                this.thumbnail1FilePath = thumbnail1FilePath;
//            }
//
//            public String getThumbnail2FilePath() {
//                return thumbnail2FilePath;
//            }
//
//            public void setThumbnail2FilePath(String thumbnail2FilePath) {
//                this.thumbnail2FilePath = thumbnail2FilePath;
//            }
//
//            public String getThumbnail3FilePath() {
//                return thumbnail3FilePath;
//            }
//
//            public void setThumbnail3FilePath(String thumbnail3FilePath) {
//                this.thumbnail3FilePath = thumbnail3FilePath;
//            }
//        }
//    }
//}
