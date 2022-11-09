"use strict";

new Vue({
    el: '#app',
    data: {
        name:'bingbing',
        noteCategories:[],
        coverPictures:[],
        showCreateCategory:false,
        showCreateNote:false,
        categoryName:'',
        noteName:'',
        note:'',
        showEdit:false,
        showMd:true,
        showDelete:false,
        showSave:false,
        showRenameCategory:false,
        renameCategoryValue:'',
        renameNoteValue:'',
        donationQrCode:'',
        showSetting:false,
        showSelectQrCode:false
    },
    created:function () {
        this.getCategories();
        let _this = this;
        this.showSetting = false;
        setTimeout(function () {
            _this.showMd = false;
        },1000)
    },
    methods:{
        createDir:function () {
            this.showCreateCategory = true;
        },

        enterNoteCategory:function(id){
            let categoryData = this.noteCategories;
            this.noteCategories = categoryData.map(function (item) {
                if(item.id == id){
                    item.showBackgroud = true;
                    item.showOperate = true;
                }else{
                    item.showBackgroud = false;
                    item.showOperate = false;
                }
                return item;
            })
        },

        leaveNoteCategory:function () {
            let categoryData = this.noteCategories;
            this.noteCategories = categoryData.map(function (item) {
                item.showOperate = false;
                return item;
            })
        },

        /**
         * 获取笔记本列表
         * */
        getCategories:function () {
            let categoryData = this.noteCategories;
            let _this = this;
            axios.get("admin/note_category/list",{}).then( res=> {
                if(res.data.code != 500){
                    this.noteCategories = res.data.map(function (item) {
                        item = _this.formatSingleNoteCateGory(item);
                        categoryData.push(item);
                        return item;
                    })
                }else{
                    layer.msg(res.data.message);
                }
            }).catch(function (error) {
                console.log(error);
            });
        },

        /**
         * 格式化单挑笔记簿
         *
         * */
        formatSingleNoteCateGory:function (category) {
            let _this = this;
            category.notes.map(function (note) {
                return _this.formatSingleNote(note);
            });
            category.showRenameCategory = false;
            category.showNotes = false;
            category.showBackgroud = false;
            category.showOperate = false;
            return category;
        },

        /**
         * 格式化数据
         *
         * @param note
         * @returns {*}
         */
        formatSingleNote:function (note) {
            note.tap=false;
            note.enter=false;
            note.showCreateNote=false;
            note.showEdit = false;
            note.showRenameNote = false;
            return note;
        },

        /**
         * 新建笔记本
         *
         * */
        createNote:function (id) {
            let note = this.noteName;
            if(note == '' || note == undefined){
                layer.msg("名字不能为空");
                return false
            }
            let _this = this;
            axios.post("admin/note/create",{title:note,category_id:id}).then( res=> {
                if(res.data.code != 500){
                    _this.noteName = '';
                    _this.hiddenCreateNote(id,_this);
                    _this.appendNote(res.data);
                }else{
                    layer.msg(res.data.message);
                }
            }).catch(function (error) {
                console.log(error);
            });
        },

        /**
         * 隐藏新建笔记的输入框
         *
         * */
        hiddenCreateNote:function (id) {
            let categoryData = this.noteCategories;
            this.noteCategories = categoryData.map(function (item) {
                if(item.id == id){
                    item.showCreateNote = false;
                }
                return item;
            })
        },

        /**
         * 添加日志到日志类目
         *
         * @author yezi
         * @param note
         */
        appendNote:function (note) {
            let categoryData = this.noteCategories;
            this.noteCategories = categoryData.map(function (item) {
                if(note.category_id == item.id){
                    item.notes.push(note);
                }
                return item;
            })
        },

        /**
         * 显示创建笔记的按钮
         *
         * */
        showCreateNoteButton:function(id){
            this.showCreateCategory = false;
            let categoryData = this.noteCategories;
            this.noteCategories = categoryData.map(function (item) {
                if(item.id == id){
                    item.showCreateNote = true;
                }else{
                    item.showCreateNote = false;
                }

                return item;
            })
        },
        /**
         * 新建笔记簿
         * */
        createCategory:function () {
            let categoryName = this.categoryName;
            if(categoryName == '' || categoryName == undefined){
                layer.msg("名字不能为空");
                return false
            }

            let _this = this;
            axios.post("admin/note_category/create",{name:categoryName}).then( res=> {
                console.log(res.data);
                if(res.data.code != 500){
                    _this.showCreateCategory = false;
                    _this.categoryName = '';
                    let categoryData = _this.noteCategories;
                    categoryData.push(_this.formatSingleNoteCateGory(res.data));
                    _this.noteCategories = categoryData;
                }else{
                    layer.msg(res.data.message);
                }
            }).catch(function (error) {
                console.log(error);
            });

        },
        showNoteList:function (id) {
            this.showCreateCategory = false;
            let categoryData = this.noteCategories;
            this.noteCategories = categoryData.map(function (item) {
                if(item.id == id){
                    if(item.showNotes == true){
                        item.showNotes = false;
                    }else{
                        item.showNotes = true;
                    }

                }

                return item;
            })
        },

        /**
         * 监控鼠标进入事件，改变背景颜色
         *
         * @param categoryId
         * @param noteId
         * @author 叶子
         **/
        enterNote:function (categoryId,noteId) {
            let categoryData = this.noteCategories;
            this.noteCategories = categoryData.map(function (item) {
                if(item.id == categoryId){
                    item.notes = item.notes.map(function (sub) {
                        if(sub.id == noteId && sub.tap == false){
                            sub.enter = true;
                            sub.showEdit = true;
                        }else{
                            sub.enter = false;
                            sub.showEdit = false;
                        }
                        return sub;
                    })
                }
                return item;
            })
        },

        /**
         * 监听鼠标移
         * */
        leaveNote:function () {
            let categoryData = this.noteCategories;
            this.noteCategories = categoryData.map(function (item) {
                item.notes = item.notes.map(function (sub) {
                    sub.enter = false;
                    sub.showEdit = false;
                    sub.showRenameNote = false;
                    return sub;
                });
                return item;
            })
        },

        /**
         * 监控鼠标点击笔记改变背景颜色
         *
         * @author yezi
         * @param categoryId
         * @param noteId
         */
        openNote:function(categoryId,noteId){
            this.showEdit = true;
            this.showDelete = true;
            this.showMd = false;
            this.showSave = false;

            let categoryData = this.noteCategories;
            this.noteCategories = categoryData.map(function (item) {
                if(item.id == categoryId){
                    item.notes = item.notes.map(function (sub) {
                        if(sub.id == noteId){
                            sub.tap = true;
                        }else{
                            sub.tap = false;
                        }
                        sub.enter = false;
                        return sub;
                    })
                }else{
                    item.notes = item.notes.map(function (sub) {
                        sub.tap = false;
                        sub.enter = false;
                        return sub;
                    })
                }
                return item;
            });

            let _this = this;

            //获取文章
            axios.get(`admin/note/${categoryId}/${noteId}`,{}).then( res=> {
                if(res.data.code != 500){
                    _this.coverPictures = res.data.attachments;
                    _this.note = res.data;

                    editormd.markdownToHTML("viewMd", {
                        markdown        : res.data.content ,
                        htmlDecode      : "style,script,iframe",
                        tocm            : true,
                        emoji           : true,
                        taskList        : true,
                        tex             : true,
                        flowChart       : true,
                        sequenceDiagram : true,
                    });
                }else{
                    layer.msg(res.data.message);
                }
            }).catch(function (error) {
                console.log(error);
            });
        },

        getMarkdownPicture:function (content) {
            const str = content;
            const pattern = /!\[(.*?)\]\((.*?)\)/mg;
            const result = [];
            let matcher;

            while ((matcher = pattern.exec(str)) !== null) {
                result.push(matcher[2]);
            }

            return result;
        },

        /**
         * 保存编辑内容
         */
        saveEdit:function () {
            let _this = this;
            this.note.content = editorMd.getValue();
            let attachments = this.getMarkdownPicture(this.note.content);

            axios.post(`admin/note/update/${this.note.id}`,{content:this.note.content,attachments:attachments}).then( res=> {
                console.log(res.data);
                if(res.data.code != 500){
                    viewMd = editormd.markdownToHTML("viewMd", {
                        markdown        : res.data.content ,
                        htmlDecode      : "style,script,iframe",
                        tocm            : true,
                        emoji           : true,
                        taskList        : true,
                        tex             : true,
                        flowChart       : true,
                        sequenceDiagram : true,
                    });
                    _this.showEdit = true;
                    _this.showMd = false;
                    _this.showSave = false;
                }else{
                    layer.msg(res.data.message);
                }
            }).catch(function (error) {
                console.log(error);
            });
        },
        /**
         * 显示markdown编辑框
         */
        showEditMd:function () {
            this.showEdit = false;
            this.showMd = true;
            this.showSave = true;
            editorMd.setValue(this.note.content);
        },
        /**
         * 初始化markdown参数
         */
        mdInit:function () {
            editorMd.setValue("");
            this.showEdit=false;
            this.showMd=false;
            this.showDelete=false;
            this.showSave=false;
        },
        /**
         * 删除日志分类
         *
         * @author yezi
         * @param id
         */
        deleteCategory:function (id) {
            let _this = this;
            let categoryData = _this.noteCategories;
            layer.confirm('确认要删除吗？',function(index){
                axios.post(`admin/note_category/${id}/delete`,{}).then( res=> {
                    console.log(res.data);
                    if(res.data.code == 500){
                        layer.msg(res.data.message);
                    }else{
                        layer.msg("删除成功");
                        _this.noteCategories = categoryData.filter(function (item) {
                            if(item.id != id){
                                return item;
                            }
                        });
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            });
        },
        /**
         * 删除笔记
         */
        deleteNote:function () {
            let _this = this;
            let id = this.note.id;
            let categoryId = this.note.category_id;
            let categoryData = _this.noteCategories;

            layer.confirm('确认要删除吗？',function(index){
                axios.post(`admin/note/${id}/delete`,{}).then( res=> {
                    console.log(res.data);
                    if(res.data.code == 500){
                        layer.msg(res.data.message);
                    }else{
                        layer.msg("删除成功");
                        _this.note = '';
                        viewMd = editormd.markdownToHTML("viewMd", {
                            markdown        : _this.note.content ,
                            htmlDecode      : "style,script,iframe",
                            tocm            : true,
                            emoji           : true,
                            taskList        : true,
                            tex             : true,
                            flowChart       : true,
                            sequenceDiagram : true,
                        });

                        _this.noteCategories = categoryData.map(function (item) {
                            if(item.id == categoryId){
                                item.notes = item.notes.filter(function (noteItem) {
                                    if(noteItem.id != id){
                                        return noteItem;
                                    }else{
                                        console.log("删除");
                                    }
                                })
                            }
                            return item;
                        });
                        _this.mdInit();
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            });
        },

        /**
         * 选择图片并且上传到七牛
         *
         * @param event
         */
        selectDonationQrCode:function (event) {
            let file = event.target.files[0];
            let imageArray = this.coverPictures;
            let _this = this;

            uploadPicture(file,function (res) {
                axios.post(`admin/setting_donation`,{url:IMAGE_URL+res.key}).then( response=> {
                    console.log(res.data);
                    if(response.data.code == 500){
                        layer.msg(response.data.message);
                    }else{
                        console.log(IMAGE_URL+res.key)
                        _this.donationQrCode = IMAGE_URL+res.key;
                        _this.showSelectQrCode = false;
                    }
                }).catch(function (error) {
                    console.log(error);
                });

            },function (res) {
                //var total = res.total;
                console.log(res)
            },function (res) {
                layer.msg("添加图片失败");
            },ZONE);

        },

        showSettingDiv:function () {
            this.showSetting = true;
            let _this = this;
            axios.get(`admin/donation_qr_code`,{}).then( res=> {
                if(res.data.code == 500){
                    layer.msg(res.data.message);
                }else{
                    _this.donationQrCode = res.data;
                    if(_this.donationQrCode){
                        _this.showSelectQrCode = false;
                    }else{
                        _this.showSelectQrCode = true;
                    }
                }
            }).catch(function (error) {
                console.log(error);
            });
        },

        hiddenSetting:function () {
            this.showSetting = false;
        },

        /**
         * 进入封面事件
         **/
        enterCover:function(name){
            if(this.showSave == true){
                let imageArray = this.coverPictures;
                this.coverPictures = imageArray.map(function (item) {
                    if(item.name == name){
                        item.show = true;
                    }
                    return item;
                });
            }
        },

        /**
         * 封面移出事件
         **/
        leaveCover:function(name){
            if(this.showSave == true){
                let imageArray = this.coverPictures;
                this.coverPictures = imageArray.map(function (item) {
                    if(item.name == name){
                        item.show = false;
                    }
                    return item;
                });
            }
        },

        /**
         * 移除图片
         *
         * @param name
         */
        deleteImage:function (name) {
            let imageArray = this.coverPictures;
            this.coverPictures = imageArray.filter(function (item) {
                if(item.name != name){
                    return item;
                }
            });
        },

        renameCategory:function (id) {
            let _this = this;
            this.noteCategories = this.noteCategories.map(function (item) {
                if(item.id == id){
                    item.showRenameCategory = true;
                    _this.renameCategoryValue = item.name;
                }else{
                    item.showRenameCategory = false;
                }
                return item;
            })
        },
        enterRenameCategory:function (name) {

        },
        /**
         * 监听重命名鼠标移除事件
         *
         * @author yezi
         * @param id
         * @param type
         * @returns {boolean}
         */
        leaveRenameCategory:function(id,type){
            let name = this.renameCategoryValue;
            if(name == '' || type != 1){
                this.renameCategoryValue = '';
                this.noteCategories = this.noteCategories.map(function (item) {
                    if(item.id == id){
                        item.showRenameCategory = false;
                        item.showBackgroud = true;
                    }
                    return item;
                });
                return false;
            }

            let _this = this;
            axios.post(`admin/note_category/${id}/rename`,{name:name}).then( res=> {
                console.log(res.data);
                if(res.data.code == 500){
                    layer.msg(res.data.message);
                }else{
                    _this.renameCategoryValue = '';
                    _this.noteCategories = _this.noteCategories.map(function (item) {
                        if(item.id == id){
                            item.showRenameCategory = false;
                            item.showBackgroud = true;
                            item.name = name;
                        }
                        return item;
                    });
                }
            }).catch(function (error) {
                console.log(error);
            });

        },

        /**
         * 点击编辑笔记标题
         *
         * @param id
         */
        renameNote:function (id) {
            let _this = this;
            this.noteCategories = this.noteCategories.map(function (item) {
                item.notes = item.notes.map(function (sub) {
                    if(id == sub.id){
                        sub.enter = true;
                        sub.showRenameNote = true;
                        _this.renameNoteValue = sub.title;
                    }else{
                        sub.enter = false;
                        sub.showRenameNote = false;
                    }
                    sub.showEdit = false;
                    sub.tap = false;
                    return sub;
                });
                return item;
            })
        },
        leaveNoteInput:function (id,categoryId,title) {
            let name = this.renameNoteValue;
            if(name == '' || name == title){
                return false;
            }

            let _this = this;
            axios.post(`admin/note/${id}/rename`,{title:name}).then( res=> {
                if(res.data.code == 500){
                    layer.msg(res.data.message);
                }else{
                    _this.renameNoteValue = '';
                    this.noteCategories = this.noteCategories.map(function (item) {
                        if(categoryId == item.id){
                            item.notes = item.notes.map(function (sub) {
                                if(id == sub.id){
                                    sub.enter = true;
                                    sub.showRenameNote = false;
                                    sub.title = name;
                                }else{
                                    sub.enter = false;
                                    sub.showRenameNote = false;
                                }
                                sub.showEdit = false;
                                sub.tap = false;
                                return sub;
                            });
                        }
                        return item;
                    })
                }
            }).catch(function (error) {
                console.log(error);
            });
        },
    }
});