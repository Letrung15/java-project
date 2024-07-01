import React, { useEffect, useState } from 'react'
import { makeStyles } from '@mui/styles';
import Paper from '@mui/material/Paper';
import Grid from '@mui/material/Grid';
import Typography from '@mui/material/Typography';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';
import Alert from '@mui/material/Alert';
import { useNavigate, useParams } from 'react-router-dom';
import productservice from '../../../services/ProductService';
import staffAccountsService from '../../../services/StaffAccountService';
import tagservice from '../../../services/TagService';
import categoryservice from '../../../services/CategoryService';
import galleryservice from '../../../services/GalleryService';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { Chip } from '@mui/material';
import { CKEditor } from '@ckeditor/ckeditor5-react';
import axios from 'axios';
import { Image } from 'react-bootstrap';
const IMAGE_URL = "http://localhost:8080/upload/";
const customSpacing = (multiplier) => `${multiplier * 8}px`;
const useStyles = makeStyles(() => ({
    root: {
        flexGrow: 1,
        marginTop: 27,
        height: 800, // Độ cao cố định

    },
    paper: {
        padding: customSpacing(2),
        margin: 'auto',
        maxWidth: 800,
        height: '100%',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'space-between',
        overflowY: 'auto',

    },
    title: {
        fontSize: 30,
        textAlign: 'center',
    },
    link: {
        padding: 10,
        display: 'inline-block',
    },
    txtInput: {
        width: '98%',
        margin: '1%',
    },
    submit: {
        margin: `${customSpacing(3)} 0 ${customSpacing(2)}`,
    },
    gridItem: {
        height: '700px',
        overflowY: 'auto',

    },
    gridContainerCenter: {
        justifyContent: 'center',
    },

}));
const currencies = [
    {
        value: 'USD',
        label: '$',
    },
    {
        value: 'EUR',
        label: '€',
    },
    {
        value: 'BTC',
        label: '฿',
    },
    {
        value: 'JPY',
        label: '¥',
    },
];

export default function ProductUpdateLater() {
    const { id } = useParams();
    const [idProduct, setIdProduct] = useState(0);
    const classes = useStyles();
    const [checkAdd, setCheckAdd] = useState(false);
    const [productName, setProductName] = useState(null)
    const [slug, setSlug] = useState(null)
    const [sku, setSku] = useState(null)
    const [salePrice, setSalePrice] = useState(null)
    const [comparePrice, setComparePrice] = useState(null)
    const [buyingPrice, setBuyingPrice] = useState(null)
    const [quantity, setQuantity] = useState(null)
    const [shortDescription, setShortDescription] = useState(null)
    const [productDescription, setProductDescription] = useState(null)
    const [note, setNote] = useState(null)
    const [productType, setProductType] = useState(null)
    const [disableOutOfStock, setDisableOutOfStock] = useState(false)
    const [published, setPublished] = useState(null)
    const [createdBy, setCreatedBy] = useState("no-one");
    const [updatedBy, setUpdatedBy] = useState("no-one");
    const [isThumbnail, setIsThumbnail] = useState(null)
    const [imagePath, setImagePath] = useState('');
    const [placeholder, setPlaceholder] = useState('');
    const [staffAccounts, setStaffAccounts] = useState([]);
    const [tags, setTags] = useState([]);
    const [categoryId, setCategoryId] = useState("no-category");
    const [categories, setCategories] = useState([]);
    const [selectedTags, setSelectedTags] = useState([]);
    const [initialTags, setInitialTags] = useState([]);
    const [tagsToDelete, setTagsToDelete] = useState([]);
    const [tagsToAdd, setTagsToAdd] = useState([]);
    const [selectedCategories, setSelectedCategories] = useState([]);
    const [initialCategories, setInitialCategories] = useState([]);
    const [categoriesToDelete, setCategoriesToDelete] = useState([]);
    const [categoriesToAdd, setCategoriesToAdd] = useState([]);
    const [images, setImages] = useState([]);
    const [editorInstance, setEditorInstance] = useState(null);




    useEffect(() => {
        productservice.GET_PRODUCT_ID(`products`, id).then(product => { // Sử dụng id từ useParams
            setIdProduct(product.data.productId)
            setProductName(product.data.productName);
            setSlug(product.data.slug);
            setSku(product.data.sku);
            setSalePrice(product.data.salePrice);
            setComparePrice(product.data.comparePrice);
            setBuyingPrice(product.data.buyingPrice);
            setQuantity(product.data.quantity);
            setShortDescription(product.data.shortDescription);
            setProductDescription(product.data.productDescription);
            setNote(product.data.note);
            setProductType(product.data.productType);
            setDisableOutOfStock(product.data.disableOutOfStock);
            setPublished(product.data.published);
            setCreatedBy(product.data.createdBy.staffAccountId);
            setUpdatedBy(product.data.updatedBy.staffAccountId);
            setIsThumbnail(product.data.productGalleries[0].thumbnail);
            setImagePath(product.data.productGalleries[0].imagePath);
            setPlaceholder(product.data.productGalleries[0].placeholder);
        });
        staffAccountsService.GET_ALL_STAFFACCOUNTS(`staffAccounts`).then(response => {
            if (response && response.data) {
                setStaffAccounts(response.data);
            }
        }).catch(error => {
            console.error("Error fetching staff accounts:", error);
        });
        tagservice.GET_ALL_TAGS(`tags`).then(response => {
            if (response && response.data) {
                setTags(response.data);
            }
        }).catch(error => {
            console.error("Error fetching tags:", error);
        });
        categoryservice.GET_ALL_CATEGORIES(`categories`).then(response => {
            if (response && response.data) {
                setCategories(response.data);
            }
        }).catch(error => {
            console.error("Error fetching categories:", error);
        });

        // Lấy danh sách các tag đã chọn ban đầu cho sản phẩm
        productservice.GET_PRODUCT_TAGS_BY_PRODUCT_ID(`productTags`, id).then(product => {
            // Kiểm tra xem dữ liệu trả về có tồn tại không
            if (product && product.data && Array.isArray(product.data)) {
                // Lấy tất cả các tagId từ mảng JSON và lưu vào mảng initialTags
                const tagIds = product.data.map(item => item.tag.tagId);
                setInitialTags(tagIds);
                setSelectedTags(tagIds);
                console.log(tagIds)
            } else {
                // Xử lý trường hợp dữ liệu không hợp lệ
                console.error("Invalid data structure or missing data");
            }
        }).catch(error => {
            // Xử lý lỗi khi gọi API
            console.error("Error fetching product tags:", error);
        });

        // Lấy danh sách các category đã chọn ban đầu cho sản phẩm
        productservice.GET_PRODUCT_CATEGORIES_BY_PRODUCT_ID(`productCategories`, id).then(product => {
            // Kiểm tra xem dữ liệu trả về có tồn tại không
            if (product && product.data && Array.isArray(product.data)) {
                // Lấy tất cả các tagId từ mảng JSON và lưu vào mảng initialCategories
                const categoryIds = product.data.map(item => item.category.categoryId);
                setInitialCategories(categoryIds);
                setSelectedCategories(categoryIds);
                console.log(categoryIds)
            } else {
                // Xử lý trường hợp dữ liệu không hợp lệ
                console.error("Invalid data structure or missing data");
            }
        }).catch(error => {
            // Xử lý lỗi khi gọi API
            console.error("Error fetching product categories:", error);
        });


    }, [id]);

    const fetchAndConvertImageToBlob = async (imageUrl) => {
        const response = await fetch(imageUrl);
        const blob = await response.blob();
        return new File([blob], "filename.jpg", { type: 'image/jpeg' });
    };

   

    // Effect to fetch images
    useEffect(() => {
        const fetchImages = async () => {
            try {
                const response = await axios.get(`http://localhost:8080/api/galleries/images/${id}`);
                const imagesWithFiles = await Promise.all(response.data.map(async (fileName) => {
                    const file = await fetchAndConvertImageToBlob(IMAGE_URL + fileName);
                    return { url: IMAGE_URL + fileName, file };
                }));
                setImages(imagesWithFiles);
            } catch (error) {
                console.error('Failed to fetch images:', error);
            }
        };

        fetchImages();
    }, [id]);

    // Generate initial editor data from images
    const getInitialEditorData = () => {
        return images.map(
            img => `<figure class="image"><img src="${img.url}" alt="Product Image"/></figure>`
        ).join('');
    };



    // CKEditor's custom upload adapter class
    class UploadAdapter {
        constructor(loader) {
            this.loader = loader;
        }
    
        upload() {
            return this.loader.file
                .then(file => {
                    return new Promise((resolve, reject) => {
                        const reader = new FileReader();
                        reader.onload = event => {
                            const url = event.target.result;
                            setImages(prevImages => [...prevImages, { url, file }]); // Store both URL and file
                            resolve({ default: url }); // URL used for display within CKEditor
                        };
                        reader.onerror = () => reject("Failed to read file.");
                        reader.readAsDataURL(file);
                    });
                });
        }
    
        abort() {
            console.log('Upload aborted');
        }
    }

    function uploadAdapterPlugin(editor) {
        editor.plugins.get('FileRepository').createUploadAdapter = loader => {
            return new UploadAdapter(loader);
        };
    }

    const handleEditorChange = (event, editor) => {
        const data = editor.getData();
        const doc = new DOMParser().parseFromString(data, 'text/html');
        const srcs = new Set(Array.from(doc.querySelectorAll('img')).map(img => img.src));
    
        setImages(currentImages => currentImages.filter(image => srcs.has(image.url)));
    };



    const handleChangeProductName = (event) => {
        setProductName(event.target.value)
    }
    const handleChangeSlug = (event) => {
        setSlug(event.target.value)
    }
    const handleChangeSku = (event) => {
        setSku(event.target.value)
    }
    const handleChangeSalePrice = (event) => {
        setSalePrice(event.target.value)
    }
    const handleChangeComparePrice = (event) => {
        setComparePrice(event.target.value)
    }
    const handleChangeBuyingPrice = (event) => {
        setBuyingPrice(event.target.value)
    }
    const handleChangeQuantity = (event) => {
        setQuantity(event.target.value);
    };
    const handleChangeShortDescription = (event) => {
        setShortDescription(event.target.value);
    };
    const handleChangeProductDescription = (event) => {
        setProductDescription(event.target.value);
    };
    const handleChangeNote = (event) => {
        setNote(event.target.value);
    };
    const handleChangeProductType = (event) => {
        const newValue = event.target.value.toString();
        setProductType(newValue);
    };
    const handleChangeDisableOutOfStock = (event) => {
        setDisableOutOfStock(event.target.value);
    };
    const handleChangeCreatedBy = (event) => {
        setCreatedBy(event.target.value);
    };
    const handleChangeUpdatedBy = (event) => {
        setUpdatedBy(event.target.value);
    };
    const handleChangePublished = (event) => {
        setPublished(event.target.value);
    };
    const handleChangeIsThumbnail = (event) => {
        setIsThumbnail(event.target.value);
    };

    // Hàm xử lý sự kiện khi thêm/xóa thẻ
    const handleChangeTagId = (event) => {
        const value = event.target.value;

        // Kiểm tra xem tag đã tồn tại trong danh sách tagsToDelete chưa
        const tagToDeleteExists = tagsToDelete.includes(value);
        // Kiểm tra xem tag đã tồn tại trong danh sách tagsToAdd chưa
        const tagToAddExists = tagsToAdd.includes(value);

        setSelectedTags(prevState => {
            // Kiểm tra xem thẻ đã được chọn có trong danh sách ban đầu không
            const tagExists = initialTags.includes(value);
            if (tagExists) {
                // Nếu thẻ đã tồn tại, loại bỏ nó khỏi danh sách xóa nếu chưa tồn tại
                if (!tagToDeleteExists) {
                    setTagsToDelete(prevState => [...prevState, value]);
                }
            } else {
                // Nếu thẻ mới, thêm vào danh sách thêm mới nếu chưa tồn tại và chưa tồn tại trong tagsToDelete
                if (!tagToAddExists && !prevState.includes(value)) {
                    setTagsToAdd(prevState => [...prevState, value]);
                }
            }

            // Trả về danh sách thẻ đã chọn mới
            return prevState.includes(value) ? prevState.filter(tag => tag !== value) : [...prevState, value];
        });
    };




    const handleDeleteTag = (tagIdToDelete) => {
        // Loại bỏ thẻ khỏi danh sách selectedTags
        setSelectedTags((prevTags) => prevTags.filter((tagId) => tagId !== tagIdToDelete));

        // Kiểm tra xem thẻ đã được chọn có trong danh sách ban đầu không
        const tagExists = initialTags.includes(tagIdToDelete);
        if (tagExists) {
            // Nếu thẻ đã tồn tại, thêm vào danh sách xóa thực sự
            setTagsToDelete(prevState => [...prevState, tagIdToDelete]);
        }
    };

    // Hàm xử lý sự kiện khi thêm/xóa thẻ
    const handleChangeCategoryId = (event) => {
        const value = event.target.value;

        // Kiểm tra xem category đã tồn tại trong danh sách categoriesToDelete chưa
        const categoryToDeleteExists = categoriesToDelete.includes(value);
        // Kiểm tra xem category đã tồn tại trong danh sách categoriesToDelete chưa
        const categoryToAddExists = categoriesToAdd.includes(value);

        setSelectedCategories(prevState => {
            // Kiểm tra xem thẻ đã được chọn có trong danh sách ban đầu không
            const categoryExists = initialCategories.includes(value);
            if (categoryExists) {
                // Nếu thẻ đã tồn tại, loại bỏ nó khỏi danh sách xóa nếu chưa tồn tại
                if (!categoryToDeleteExists) {
                    setCategoriesToDelete(prevState => [...prevState, value]);
                }
            } else {
                // Nếu thẻ mới, thêm vào danh sách thêm mới nếu chưa tồn tại và chưa tồn tại trong categoriesToDelete
                if (!categoryToAddExists && !prevState.includes(value)) {
                    setCategoriesToAdd(prevState => [...prevState, value]);
                }
            }

            // Trả về danh sách thẻ đã chọn mới
            return prevState.includes(value) ? prevState.filter(category => category !== value) : [...prevState, value];
        });
    };

    const handleDeleteCategory = (categoryIdToDelete) => {
        // Loại bỏ thẻ khỏi danh sách selectedTags
        setSelectedCategories((prevCategories) => prevCategories.filter((categoryId) => categoryId !== categoryIdToDelete));

        // Kiểm tra xem thẻ đã được chọn có trong danh sách ban đầu không
        const categoryExists = initialCategories.includes(categoryIdToDelete);
        if (categoryExists) {
            // Nếu thẻ đã tồn tại, thêm vào danh sách xóa thực sự
            setCategoriesToDelete(prevState => [...prevState, categoryIdToDelete]);
        }
    };

    const EditProduct = (event) => {
        event.preventDefault();
        if (productName !== "" && slug !== "" && sku !== "" && salePrice !== "" && comparePrice !== "" &&
            buyingPrice !== "" && quantity !== "" && shortDescription !== "" && productDescription !== "" &&
            note !== "" && productType !== "" && disableOutOfStock !== null && createdBy !== "no-one" && updatedBy !== "no-one" && published !== null
            && isThumbnail !== null && imagePath !== "" && placeholder !== "" && selectedTags.length > 0 && selectedCategories.length > 0) {
            let product = {
                slug: slug,
                productName: productName,
                sku: sku,
                salePrice: salePrice,
                comparePrice: comparePrice,
                buyingPrice: buyingPrice,
                quantity: quantity,
                shortDescription: shortDescription,
                productDescription: productDescription,
                note: note,
                productType: productType,
                disableOutOfStock: disableOutOfStock,
                published: published,
                createdBy: {
                    staffAccountId: createdBy
                },
                updatedBy: {
                    staffAccountId: updatedBy
                }
            };

            productservice.PUT_EDIT_PRODUCT(`products/${idProduct}`, product).then(item => {
                if (item.data) {
                    const productId = item.data.productId; // Lấy ID của sản phẩm mới tạo

                    
                    const formData = new FormData();
                    images.forEach(({ file }) => formData.append('files', file));
                    try {
                        const imageUploadResponse = axios.post(`http://localhost:8080/api/galleries/update/${productId}/${updatedBy}`, formData, {
                            headers: { 'Content-Type': 'multipart/form-data' }
                        });
                        console.log('Images uploaded:', imageUploadResponse.data);
                        // Other processing code here...

                    } catch (error) {
                        console.error('Failed to upload images:', error);
                    }

                    // Xóa các thẻ không còn tồn tại
                    tagsToDelete.forEach(tagId => {
                        productservice.DELETE_PRODUCT_TAGS_BY_TAG_ID_FROM_PRODUCT('productTags', productId, tagId)
                            .then(response => {
                                console.log("Deleted tag:", response.data);
                            })
                            .catch(error => {
                                console.error("Error deleting tag:", error);
                            });
                    });

                    // Thêm các thẻ mới vào sản phẩm
                    tagsToAdd.forEach(tagId => {
                        const product_tag = {
                            tag: { tagId },
                            product: { productId }
                        };
                        productservice.POST_ADD_PRODUCT_TAG(`productTags`, product_tag)
                            .then(response => {
                                console.log("Added tag:", response.data);
                            })
                            .catch(error => {
                                console.error("Error adding tag:", error);
                            });
                    });

                    // Xóa các thẻ không còn tồn tại
                    categoriesToDelete.forEach(categoryId => {
                        productservice.DELETE_PRODUCT_CATEGORIES_BY_PRODUCT_ID_AND_CATEGORY_ID('productCategories', productId, categoryId)
                            .then(response => {
                                console.log("Deleted category:", response.data);
                            })
                            .catch(error => {
                                console.error("Error deleting category:", error);
                            });
                    });

                    // Thêm các thẻ mới vào sản phẩm
                    categoriesToAdd.forEach(categoryId => {
                        const product_category = {
                            product: {
                                productId
                            },
                            category: {
                                categoryId
                            }
                        };
                        productservice.POST_ADD_PRODUCT_CATEGORY(`productCategories`, product_category)
                            .then(response => {
                                console.log("Added category:", response.data);
                            })
                            .catch(error => {
                                console.error("Error adding category:", error);
                            });
                    });




                    setCheckAdd(true);
                }
            }).catch(error => {
                console.error("Error editing product:", error);
            });
        } else {
            alert("Bạn chưa nhập đủ thông tin!");
        }
    };
    const navigate = useNavigate();
    if (checkAdd) {
        navigate('/admin/product/all-product');
    }
    return (

        <div className={classes.root}>
            <Grid container spacing={3} alignItems="stretch">
                {/* Bảng "Update Product" */}
                <Grid item xs={4} className={classes.gridItem}>
                    <Paper className={classes.paper}>
                        {/* Các thành phần của bảng "Update Product" */}
                        <Typography gutterBottom variant="h5" align="center">
                            Update Product
                        </Typography>
                        {/* Thêm các thành phần của bảng "Update Product" ở đây */}
                        {/* Ví dụ: */}
                        <Grid container spacing={2} >
                            <Grid item xs={12}>
                                <Typography gutterBottom variant="subtitle1">
                                    Product Name
                                </Typography>
                                <TextField id="ProductName" onChange={handleChangeProductName} name="ProductName" value={productName}
                                    variant="outlined" className={classes.txtInput} size="small" />
                            </Grid>
                            <Grid item xs={12}>
                                <Typography gutterBottom variant="subtitle1">
                                    Slug
                                </Typography>
                                <TextField id="Slug" onChange={handleChangeSlug} name="Slug" value={slug}
                                    variant="outlined" className={classes.txtInput} size="small" />
                            </Grid>
                            <Grid item xs={12}>
                                <Typography gutterBottom variant="subtitle1">
                                    Sku
                                </Typography>
                                <TextField id="Sku" onChange={handleChangeSku} name="Sku" value={sku}
                                    variant="outlined" className={classes.txtInput} size="small" />
                            </Grid>
                            <Grid item xs={12}>
                                <Typography gutterBottom variant="subtitle1">
                                    Sale Price
                                </Typography>
                                <TextField id="SalePrice" onChange={handleChangeSalePrice} name="SalePrice" value={salePrice}
                                    variant="outlined" className={classes.txtInput} size="small" />
                            </Grid>
                            <Grid item xs={12}>
                                <Typography gutterBottom variant="subtitle1">
                                    Compare Price
                                </Typography>
                                <TextField id="ComparePrice" onChange={handleChangeComparePrice} name="ComparePrice" value={comparePrice}
                                    variant="outlined" className={classes.txtInput} size="small" />
                            </Grid>
                            <Grid item xs={12}>
                                <Typography gutterBottom variant="subtitle1">
                                    Buying Price
                                </Typography>
                                <TextField id="BuyingPrice" onChange={handleChangeBuyingPrice} name="BuyingPrice" value={buyingPrice}
                                    variant="outlined" className={classes.txtInput} size="small" />
                            </Grid>
                            <Grid item xs={12}>
                                <Typography gutterBottom variant="subtitle1">
                                    Quantity
                                </Typography>
                                <TextField id="Quantity" onChange={handleChangeQuantity} name="Quantity" value={quantity}
                                    variant="outlined" className={classes.txtInput} size="small" />
                            </Grid>
                            <Grid item xs={12}>
                                <Typography gutterBottom variant="subtitle1">
                                    Short Description
                                </Typography>
                                <TextField id="outlined-multiline-static" onChange={handleChangeShortDescription} value={shortDescription}
                                    name="ShortDescription" className={classes.txtInput} multiline rows={4} variant="outlined" />
                            </Grid>
                            <Grid item xs={12}>
                                <Typography gutterBottom variant="subtitle1">
                                    Product Description
                                </Typography>
                                <TextField id="outlined-multiline-static" onChange={handleChangeProductDescription} value={productDescription}
                                    name="ProductDescription" className={classes.txtInput} multiline rows={4} variant="outlined" />
                            </Grid>
                            <Grid item xs={12}>
                                <Typography gutterBottom variant="subtitle1">
                                    Note
                                </Typography>
                                <TextField id="outlined-multiline-static" onChange={handleChangeNote} value={note}
                                    name="Note" className={classes.txtInput} multiline rows={4} variant="outlined" />
                            </Grid>
                            <Grid item xs={12} style={{ marginBottom: '16px' }}>
                                <Typography gutterBottom variant="subtitle1">
                                    Choose ProductType
                                </Typography>
                                <TextField
                                    id="outlined-select-currency-native"
                                    name="productType"
                                    select
                                    value={productType}
                                    onChange={handleChangeProductType}
                                    SelectProps={{
                                        native: true,
                                    }}
                                    variant="outlined"
                                    className={classes.txtInput}
                                >
                                    <option value="null">Null</option>
                                    <option value="sale">Sale</option>
                                    <option value="new">New</option>
                                    <option value="15%">15%</option>
                                </TextField>
                            </Grid>

                            <Grid item xs={12} style={{ marginBottom: '16px' }}>
                                <Typography gutterBottom variant="subtitle1">
                                    Choose DisableStock
                                </Typography>
                                <TextField
                                    id="outlined-select-currency-native"
                                    name="disableOutOfStock"
                                    select
                                    value={disableOutOfStock} // Giá trị boolean
                                    onChange={handleChangeDisableOutOfStock}
                                    SelectProps={{
                                        native: true,
                                    }}
                                    variant="outlined"
                                    className={classes.txtInput}
                                >
                                    <option value="true">True</option>
                                    <option value="false">False</option>
                                </TextField>
                            </Grid>
                            <Grid item xs={12} style={{ marginBottom: '16px' }}>
                                <Typography gutterBottom variant="subtitle1">
                                    Choose Published
                                </Typography>
                                <TextField
                                    id="outlined-select-currency-native"
                                    name="published"
                                    select
                                    value={published} // Giá trị boolean
                                    onChange={handleChangePublished}
                                    SelectProps={{
                                        native: true,
                                    }}
                                    variant="outlined"
                                    className={classes.txtInput}
                                >
                                    <option value="true">True</option>
                                    <option value="false">False</option>
                                </TextField>
                            </Grid>
                            <Grid item xs={12} style={{ marginBottom: '16px' }}>
                                <Typography gutterBottom variant="subtitle1">
                                    Choose CreatedBy
                                </Typography>
                                <TextField
                                    id="outlined-select-currency-native"
                                    name="createdBy"
                                    select
                                    value={createdBy}
                                    onChange={handleChangeCreatedBy}
                                    SelectProps={{
                                        native: true,
                                    }}
                                    variant="outlined"
                                    className={classes.txtInput}
                                >
                                    <option value="no-one">Choose StaffAccount</option>
                                    {staffAccounts.length > 0 && staffAccounts.map((option) => (
                                        <option key={option.staffAccountId} value={option.staffAccountId}>
                                            {`${option.firstName} ${option.lastName}`}
                                        </option>
                                    ))}
                                </TextField>
                            </Grid>
                            <Grid item xs={12} style={{ marginBottom: '16px' }}>
                                <Typography gutterBottom variant="subtitle1">
                                    Choose UpdatedBy
                                </Typography>
                                <TextField
                                    id="outlined-select-currency-native"
                                    name="updatedBy"
                                    select
                                    value={updatedBy}
                                    onChange={handleChangeUpdatedBy}
                                    SelectProps={{
                                        native: true,
                                    }}
                                    variant="outlined"
                                    className={classes.txtInput}
                                >
                                    <option value="no-one">Choose StaffAccount</option>
                                    {staffAccounts.length > 0 && staffAccounts.map((option2) => (
                                        <option key={option2.staffAccountId} value={option2.staffAccountId}>
                                            {`${option2.firstName} ${option2.lastName}`}
                                        </option>
                                    ))}
                                </TextField>
                            </Grid>
                        </Grid>

                    </Paper>
                </Grid>

                {/* Bảng "Update Gallery" */}
                <Grid item xs={4} className={classes.gridItem}>
                    <Paper className={classes.paper}>
                        {/* Các thành phần của bảng "Update Gallery" */}
                        <Typography gutterBottom variant="h5" align="center">
                            Update Gallery
                        </Typography>
                        {/* Thêm các thành phần của bảng "Update Gallery" ở đây */}
                        <Grid container spacing={2}>
                            <Grid item xs={12} style={{ marginBottom: '16px' }}>
                                {/* <CKEditor
                                    editor={ClassicEditor}
                                    data={isDataLoaded ? editorData : ''}
                                    onReady={editor => {
                                        setEditorInstance(editor);
                                    }}
                                    onChange={(event, editor) => {
                                        const data = editor.getData();
                                        const doc = new DOMParser().parseFromString(data, 'text/html');
                                        const srcs = Array.from(doc.querySelectorAll('img')).map(img => img.getAttribute('src'));

                                        // Remove images from the images state and API data if they are not present in the editor
                                        const filteredImages = images.filter(image => srcs.includes(image.url));
                                        setImages(filteredImages);
                                    }}
                                    config={{
                                        extraPlugins: [uploadAdapterPlugin],
                                    }}
                                /> */}
                                <CKEditor
                                    editor={ClassicEditor}
                                    data={getInitialEditorData()}
                                    onReady={editor => {
                                        setEditorInstance(editor);
                                        editor.setData(getInitialEditorData());
                                    }}
                                    onChange={handleEditorChange}
                                    config={{
                                        extraPlugins: [uploadAdapterPlugin],
                                    }}
                                />
                            </Grid>
                            <Grid item xs={12} style={{ marginBottom: '16px' }}>
                                <Typography gutterBottom variant="subtitle1">
                                    Choose IsThumbnail
                                </Typography>
                                <TextField
                                    id="outlined-select-currency-native"
                                    name="IsThumbnail"
                                    select
                                    value={isThumbnail}
                                    onChange={handleChangeIsThumbnail}
                                    SelectProps={{
                                        native: true,
                                    }}
                                    variant="outlined"
                                    className={classes.txtInput}
                                >
                                    <option value="true">True</option>
                                    <option value="false">False</option>
                                </TextField>
                            </Grid>
                        </Grid>

                    </Paper>
                </Grid>

                {/* Bảng "Update Product_Category_Tag" */}
                <Grid item xs={4} className={classes.gridItem}>
                    <Paper className={classes.paper}>
                        {/* Các thành phần của bảng "Update Product_Category_Tag" */}
                        <Typography gutterBottom variant="h5" align="center">
                            Update Cate_Tag
                        </Typography>
                        {/* Thêm các thành phần của bảng "Update Product_Category_Tag" ở đây */}
                        <Grid container spacing={2} >
                            <Grid item xs={12} style={{ marginBottom: '16px' }}>
                                <Typography gutterBottom variant="subtitle1">
                                    Choose Tag
                                </Typography>
                                <div>
                                    {selectedTags.map((tagId) => {
                                        // Tìm tag trong mảng tags
                                        const foundTag = tags.find(tag => tag.tagId === tagId);
                                        // Nếu không tìm thấy, trả về null
                                        if (!foundTag) return null;

                                        // Nếu tìm thấy, hiển thị Chip với label là tagName của tag
                                        return (
                                            <Chip
                                                key={tagId}
                                                label={foundTag.tagName}
                                                onDelete={() => handleDeleteTag(tagId)}
                                                className={classes.tagChip}
                                            />
                                        );
                                    })}
                                </div>
                                <TextField
                                    id="outlined-select-currency-native"
                                    name="Tag"
                                    select
                                    value={''} // Để trống giá trị value
                                    onChange={handleChangeTagId}
                                    SelectProps={{
                                        native: true,
                                    }}
                                    variant="outlined"
                                    className={classes.txtInput}
                                    multiple
                                >
                                    <option value="no-tag">Choose Tag</option>
                                    {tags.length > 0 && tags.map((option) => (
                                        <option key={option.tagId} value={option.tagId}>
                                            {option.tagName}
                                        </option>
                                    ))}
                                </TextField>
                            </Grid>


                            <Grid item xs={12} style={{ marginBottom: '16px' }}>
                                <Typography gutterBottom variant="subtitle1">
                                    Choose Category
                                </Typography>
                                <div>
                                    {selectedCategories.map((categoryId) => {
                                        // Tìm category trong mảng tags
                                        const foundCategory = categories.find(category => category.categoryId === categoryId);
                                        // Nếu không tìm thấy, trả về null
                                        if (!foundCategory) return null;

                                        // Nếu tìm thấy, hiển thị Chip với label là tagName của tag
                                        return (
                                            <Chip
                                                key={categoryId}
                                                label={foundCategory.categoryName}
                                                onDelete={() => handleDeleteCategory(categoryId)}
                                                className={classes.tagChip}
                                            />
                                        );
                                    })}
                                </div>
                                <TextField
                                    id="outlined-select-currency-native"
                                    name="Category"
                                    select
                                    value={''} // Để trống giá trị value
                                    onChange={handleChangeCategoryId}
                                    SelectProps={{
                                        native: true,
                                    }}
                                    variant="outlined"
                                    className={classes.txtInput}
                                    multiple
                                >
                                    <option value="">Choose Category</option>
                                    {categories.length > 0 && categories.map((option) => (
                                        <option key={option.categoryId} value={option.categoryId}>
                                            {option.categoryName}
                                        </option>
                                    ))}
                                </TextField>
                            </Grid>
                        </Grid>

                    </Paper>
                </Grid>
                <Button type="button" onClick={EditProduct} fullWidth variant="contained" color="primary" className={classes.submit}>
                    Update product
                </Button>
            </Grid>
        </div>


    )
}