import React, { useEffect, useState } from 'react'
import { makeStyles } from '@mui/styles';
import Paper from '@mui/material/Paper';
import Grid from '@mui/material/Grid';
import Typography from '@mui/material/Typography';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';
import Alert from '@mui/material/Alert';
import { useNavigate } from 'react-router-dom';
import productservice from '../../../services/ProductService';
import staffAccountsService from '../../../services/StaffAccountService';
import tagservice from '../../../services/TagService';
import categoryservice from '../../../services/CategoryService';
import galleryservice from '../../../services/GalleryService';
import { Chip } from '@mui/material';
import axios from 'axios';
import { Image } from 'react-bootstrap';
import { CKEditor } from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

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
export default function ProductCreateLater() {
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
    const [published, setPublished] = useState(true)
    const [createdBy, setCreatedBy] = useState("no-one");
    const [updatedBy, setUpdatedBy] = useState("no-one");
    const [isThumbnail, setIsThumbnail] = useState(false)
    const [imagePath, setImagePath] = useState('');
    const [placeholder, setPlaceholder] = useState('');
    const [staffAccounts, setStaffAccounts] = useState([]);
    const [tags, setTags] = useState([]);
    const [categories, setCategories] = useState([]);
    const [selectedTags, setSelectedTags] = useState([]);
    const [selectedCategories, setSelectedCategories] = useState([]);
    const [images, setImages] = useState([]);

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
    


    useEffect(() => {
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

    }, []);

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

    const handleChangeTagId = (event) => {
        const value = event.target.value;
        setSelectedTags(prevState => {
            if (prevState.includes(value)) {
                return prevState.filter(tag => tag !== value);
            } else {
                return [...prevState, value];
            }
        });
    };

    const handleDeleteTag = (tagIdToDelete) => {
        setSelectedTags((prevTags) => prevTags.filter((tagId) => tagId !== tagIdToDelete));
    };

    const handleChangeCategoryId = (event) => {
        const value = event.target.value;
        setSelectedCategories(prevState => {
            if (prevState.includes(value)) {
                return prevState.filter(category => category !== value);
            } else {
                return [...prevState, value];
            }
        });
    };

    const handleDeleteCategories = (categoryIdToDelete) => {
        setSelectedCategories((prevCategories) => prevCategories.filter((categoryId) => categoryId !== categoryIdToDelete));
    };






    const addProduct = (event) => {
        event.preventDefault();
        if (productName !== "" && slug !== "" && sku !== "" && salePrice !== "" && comparePrice !== "" &&
            buyingPrice !== "" && quantity !== "" && shortDescription !== "" && productDescription !== "" &&
            note !== "" && productType !== "" && disableOutOfStock !== null && createdBy !== "no-one" && updatedBy !== "no-one" && published !== null
            && isThumbnail !== null && selectedTags.length > 0 && selectedCategories.length > 0 && images.length > 0) {
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

            productservice.POST_ADD_PRODUCT(`products`, product).then(item => {
                if (item.data) {

                    const productId = item.data.productId;

                    const formData = new FormData();
                    images.forEach(({ file }) => formData.append('files', file)); // Append actual file objects
        
                    const imageUploadResponse = axios.post(`http://localhost:8080/api/galleries/upload/${productId}/${updatedBy}`, formData, {
                        headers: { 'Content-Type': 'multipart/form-data' }
                    });
        
                    console.log('Images uploaded:', imageUploadResponse.data);

                   


                    let product_tags = selectedTags.map(tagId => ({
                        tag: { tagId },
                        product: { productId }
                    }));

                    let product_categories = selectedCategories.map(categoryId => ({
                        product: {
                            productId: productId
                        },
                        category: {
                            categoryId: categoryId
                        }
                    }));

                    product_tags.forEach(product_tag => {
                        productservice.POST_ADD_PRODUCT_TAG(`productTags`, product_tag)
                            .then(item => {
                                console.log(item.data)
                            })
                            .catch(error => {
                                console.error("Error adding product_tag:", error);
                            });
                    });

                    product_categories.forEach(product_category => {
                        productservice.POST_ADD_PRODUCT_CATEGORY(`productCategories`, product_category)
                            .then(item => {
                                console.log(item.data)
                            })
                            .catch(error => {
                                console.error("Error adding product_category:", error);
                            });
                    });


                    setCheckAdd(true);
                }
            }).catch(error => {
                console.error("Error adding product:", error);
            });
        } else {
            alert("Bạn chưa nhập đủ thông tin!");
        }
    };
    const navigate = useNavigate();
    useEffect(() => {
        if (checkAdd) {
            navigate('/admin/product/all-product');
            setTimeout(() => {
                window.location.reload();
            }, 20); // Wait for 100ms before reloading
        }
    }, [checkAdd, navigate]);
    return (
        <>
            <div className={classes.root}>
                <Grid container spacing={3} alignItems="stretch">
                    {/* Bảng "Update Product" */}
                    <Grid item xs={4} className={classes.gridItem}>
                        <Paper className={classes.paper}>
                            {/* Các thành phần của bảng "Update Product" */}
                            <Typography gutterBottom variant="h5" align="center">
                                Add Product
                            </Typography>
                            {/* Thêm các thành phần của bảng "Update Product" ở đây */}
                            {/* Ví dụ: */}
                            <Grid container spacing={2} >
                                <Grid item xs={12}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Product Name
                                    </Typography>
                                    <TextField id="ProductName" onChange={handleChangeProductName} name="ProductName" label="ProductName"
                                        variant="outlined" className={classes.txtInput} size="small" />
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Slug
                                    </Typography>
                                    <TextField id="Slug" onChange={handleChangeSlug} name="Slug" label="Slug"
                                        variant="outlined" className={classes.txtInput} size="small" />
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Sku
                                    </Typography>
                                    <TextField id="Sku" onChange={handleChangeSku} name="Sku" label="Sku"
                                        variant="outlined" className={classes.txtInput} size="small" />
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Sale Price
                                    </Typography>
                                    <TextField id="SalePrice" onChange={handleChangeSalePrice} name="SalePrice" label="SalePrice"
                                        variant="outlined" className={classes.txtInput} size="small" />
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Compare Price
                                    </Typography>
                                    <TextField id="ComparePrice" onChange={handleChangeComparePrice} name="ComparePrice" label="ComparePrice > SalePrice"
                                        variant="outlined" className={classes.txtInput} size="small" />
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Buying Price
                                    </Typography>
                                    <TextField id="BuyingPrice" onChange={handleChangeBuyingPrice} name="BuyingPrice" label="BuyingPrice"
                                        variant="outlined" className={classes.txtInput} size="small" />
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Quantity
                                    </Typography>
                                    <TextField id="Quantity" onChange={handleChangeQuantity} name="Quantity" label="Quantity"
                                        variant="outlined" className={classes.txtInput} size="small" />
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Short Description
                                    </Typography>
                                    <TextField id="outlined-multiline-static" onChange={handleChangeShortDescription} label="ShortDescription"
                                        name="ShortDescription" className={classes.txtInput} multiline rows={4} variant="outlined" />
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Product Description
                                    </Typography>
                                    <TextField id="outlined-multiline-static" onChange={handleChangeProductDescription} label="ProductDescription"
                                        name="ProductDescription" className={classes.txtInput} multiline rows={4} variant="outlined" />
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Note
                                    </Typography>
                                    <TextField id="outlined-multiline-static" onChange={handleChangeNote} label="Note"
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
                                Add Gallery
                            </Typography>
                            {/* Thêm các thành phần của bảng "Update Gallery" ở đây */}
                            <Grid container spacing={2}>
                                <Grid item xs={12}>
                                    <CKEditor
                                        editor={ClassicEditor}
                                        config={{
                                            extraPlugins: [uploadAdapterPlugin],
                                        }}
                                        onChange={handleEditorChange}
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
                                        value={isThumbnail} // Giá trị boolean
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
                                Add Cate_Tag
                            </Typography>
                            {/* Thêm các thành phần của bảng "Update Product_Category_Tag" ở đây */}
                            <Grid container spacing={2} >
                                <Grid item xs={12} style={{ marginBottom: '16px' }}>
                                    <Typography gutterBottom variant="subtitle1">
                                        Choose Tag
                                    </Typography>
                                    <div>
                                        {selectedTags.map((tagId) => (
                                            <Chip
                                                key={tagId}
                                                label={tags.find(tag => tag.tagId === tagId).tagName}
                                                onDelete={() => handleDeleteTag(tagId)}
                                                className={classes.tagChip}
                                            />
                                        ))}
                                    </div>
                                    <TextField
                                        id="outlined-select-currency-native"
                                        name="Tag"
                                        select
                                        value="" // Giá trị này không được sử dụng, chỉ để cho TextField hoạt động
                                        onChange={handleChangeTagId}
                                        SelectProps={{
                                            native: true,
                                        }}
                                        variant="outlined"
                                        className={classes.txtInput}
                                        multiple
                                    >
                                        <option value="">Choose Tag</option>
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
                                        {selectedCategories.map((categoryId) => (
                                            <Chip
                                                key={categoryId}
                                                label={categories.find(cate => cate.categoryId === categoryId).categoryName}
                                                onDelete={() => handleDeleteCategories(categoryId)}
                                                className={classes.tagChip}
                                            />
                                        ))}
                                    </div>
                                    <TextField
                                        id="outlined-select-currency-native"
                                        name="Category"
                                        select
                                        value=""
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
                    <Button type="button" onClick={addProduct} fullWidth variant="contained" color="primary" className={classes.submit}>
                        Add product
                    </Button>
                </Grid>
            </div>
        </>

    )
}