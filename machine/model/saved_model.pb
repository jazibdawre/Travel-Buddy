??
??
B
AddV2
x"T
y"T
z"T"
Ttype:
2	??
B
AssignVariableOp
resource
value"dtype"
dtypetype?
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?
=
Mul
x"T
y"T
z"T"
Ttype:
2	?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype?
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
?
ResourceGather
resource
indices"Tindices
output"dtype"

batch_dimsint "
validate_indicesbool("
dtypetype"
Tindicestype:
2	?
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ?
@
StaticRegexFullMatch	
input

output
"
patternstring
?
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*2.4.12v2.4.1-0-g85c8b2a817f8??	
?
embedding_2/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?2*'
shared_nameembedding_2/embeddings
?
*embedding_2/embeddings/Read/ReadVariableOpReadVariableOpembedding_2/embeddings*
_output_shapes
:	?2*
dtype0
?
embedding_3/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?K2*'
shared_nameembedding_3/embeddings
?
*embedding_3/embeddings/Read/ReadVariableOpReadVariableOpembedding_3/embeddings*
_output_shapes
:	?K2*
dtype0
x
dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:d
*
shared_namedense_2/kernel
q
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel*
_output_shapes

:d
*
dtype0
p
dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*
shared_namedense_2/bias
i
 dense_2/bias/Read/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes
:
*
dtype0
x
dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:
*
shared_namedense_3/kernel
q
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes

:
*
dtype0
p
dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_3/bias
i
 dense_3/bias/Read/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
?
Adam/embedding_2/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?2*.
shared_nameAdam/embedding_2/embeddings/m
?
1Adam/embedding_2/embeddings/m/Read/ReadVariableOpReadVariableOpAdam/embedding_2/embeddings/m*
_output_shapes
:	?2*
dtype0
?
Adam/embedding_3/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?K2*.
shared_nameAdam/embedding_3/embeddings/m
?
1Adam/embedding_3/embeddings/m/Read/ReadVariableOpReadVariableOpAdam/embedding_3/embeddings/m*
_output_shapes
:	?K2*
dtype0
?
Adam/dense_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:d
*&
shared_nameAdam/dense_2/kernel/m

)Adam/dense_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_2/kernel/m*
_output_shapes

:d
*
dtype0
~
Adam/dense_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*$
shared_nameAdam/dense_2/bias/m
w
'Adam/dense_2/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_2/bias/m*
_output_shapes
:
*
dtype0
?
Adam/dense_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:
*&
shared_nameAdam/dense_3/kernel/m

)Adam/dense_3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/m*
_output_shapes

:
*
dtype0
~
Adam/dense_3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/dense_3/bias/m
w
'Adam/dense_3/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/bias/m*
_output_shapes
:*
dtype0
?
Adam/embedding_2/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?2*.
shared_nameAdam/embedding_2/embeddings/v
?
1Adam/embedding_2/embeddings/v/Read/ReadVariableOpReadVariableOpAdam/embedding_2/embeddings/v*
_output_shapes
:	?2*
dtype0
?
Adam/embedding_3/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?K2*.
shared_nameAdam/embedding_3/embeddings/v
?
1Adam/embedding_3/embeddings/v/Read/ReadVariableOpReadVariableOpAdam/embedding_3/embeddings/v*
_output_shapes
:	?K2*
dtype0
?
Adam/dense_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:d
*&
shared_nameAdam/dense_2/kernel/v

)Adam/dense_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_2/kernel/v*
_output_shapes

:d
*
dtype0
~
Adam/dense_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*$
shared_nameAdam/dense_2/bias/v
w
'Adam/dense_2/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_2/bias/v*
_output_shapes
:
*
dtype0
?
Adam/dense_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:
*&
shared_nameAdam/dense_3/kernel/v

)Adam/dense_3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/v*
_output_shapes

:
*
dtype0
~
Adam/dense_3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/dense_3/bias/v
w
'Adam/dense_3/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
?9
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?8
value?8B?8 B?8
?
layer-0
layer-1
layer_with_weights-0
layer-2
layer_with_weights-1
layer-3
layer-4
layer-5
layer-6
layer-7
	layer_with_weights-2
	layer-8

layer-9
layer-10
layer_with_weights-3
layer-11
layer-12
layer-13
	optimizer
	variables
trainable_variables
regularization_losses
	keras_api

signatures
 
 
b

embeddings
	variables
trainable_variables
regularization_losses
	keras_api
b

embeddings
	variables
trainable_variables
regularization_losses
	keras_api
R
	variables
 trainable_variables
!regularization_losses
"	keras_api
R
#	variables
$trainable_variables
%regularization_losses
&	keras_api
R
'	variables
(trainable_variables
)regularization_losses
*	keras_api
R
+	variables
,trainable_variables
-regularization_losses
.	keras_api
h

/kernel
0bias
1	variables
2trainable_variables
3regularization_losses
4	keras_api
R
5	variables
6trainable_variables
7regularization_losses
8	keras_api
R
9	variables
:trainable_variables
;regularization_losses
<	keras_api
h

=kernel
>bias
?	variables
@trainable_variables
Aregularization_losses
B	keras_api
R
C	variables
Dtrainable_variables
Eregularization_losses
F	keras_api
R
G	variables
Htrainable_variables
Iregularization_losses
J	keras_api
?
Kiter

Lbeta_1

Mbeta_2
	Ndecay
Olearning_ratem?m?/m?0m?=m?>m?v?v?/v?0v?=v?>v?
*
0
1
/2
03
=4
>5
*
0
1
/2
03
=4
>5
 
?
Pmetrics
Qnon_trainable_variables
	variables
trainable_variables

Rlayers
Slayer_metrics
Tlayer_regularization_losses
regularization_losses
 
fd
VARIABLE_VALUEembedding_2/embeddings:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUE

0

0
 
?
Umetrics
Vnon_trainable_variables
	variables
trainable_variables

Wlayers
Xlayer_metrics
Ylayer_regularization_losses
regularization_losses
fd
VARIABLE_VALUEembedding_3/embeddings:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUE

0

0
 
?
Zmetrics
[non_trainable_variables
	variables
trainable_variables

\layers
]layer_metrics
^layer_regularization_losses
regularization_losses
 
 
 
?
_metrics
`non_trainable_variables
	variables
 trainable_variables

alayers
blayer_metrics
clayer_regularization_losses
!regularization_losses
 
 
 
?
dmetrics
enon_trainable_variables
#	variables
$trainable_variables

flayers
glayer_metrics
hlayer_regularization_losses
%regularization_losses
 
 
 
?
imetrics
jnon_trainable_variables
'	variables
(trainable_variables

klayers
llayer_metrics
mlayer_regularization_losses
)regularization_losses
 
 
 
?
nmetrics
onon_trainable_variables
+	variables
,trainable_variables

players
qlayer_metrics
rlayer_regularization_losses
-regularization_losses
ZX
VARIABLE_VALUEdense_2/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEdense_2/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE

/0
01

/0
01
 
?
smetrics
tnon_trainable_variables
1	variables
2trainable_variables

ulayers
vlayer_metrics
wlayer_regularization_losses
3regularization_losses
 
 
 
?
xmetrics
ynon_trainable_variables
5	variables
6trainable_variables

zlayers
{layer_metrics
|layer_regularization_losses
7regularization_losses
 
 
 
?
}metrics
~non_trainable_variables
9	variables
:trainable_variables

layers
?layer_metrics
 ?layer_regularization_losses
;regularization_losses
ZX
VARIABLE_VALUEdense_3/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEdense_3/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE

=0
>1

=0
>1
 
?
?metrics
?non_trainable_variables
?	variables
@trainable_variables
?layers
?layer_metrics
 ?layer_regularization_losses
Aregularization_losses
 
 
 
?
?metrics
?non_trainable_variables
C	variables
Dtrainable_variables
?layers
?layer_metrics
 ?layer_regularization_losses
Eregularization_losses
 
 
 
?
?metrics
?non_trainable_variables
G	variables
Htrainable_variables
?layers
?layer_metrics
 ?layer_regularization_losses
Iregularization_losses
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE

?0
 
f
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
8

?total

?count
?	variables
?	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

?0
?1

?	variables
??
VARIABLE_VALUEAdam/embedding_2/embeddings/mVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUEAdam/embedding_3/embeddings/mVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_2/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_2/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_3/kernel/mRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_3/bias/mPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUEAdam/embedding_2/embeddings/vVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
??
VARIABLE_VALUEAdam/embedding_3/embeddings/vVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_2/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_2/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/dense_3/kernel/vRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/dense_3/bias/vPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
z
serving_default_input_3Placeholder*'
_output_shapes
:?????????*
dtype0*
shape:?????????
z
serving_default_input_4Placeholder*'
_output_shapes
:?????????*
dtype0*
shape:?????????
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_3serving_default_input_4embedding_3/embeddingsembedding_2/embeddingsdense_2/kerneldense_2/biasdense_3/kerneldense_3/bias*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8? *,
f'R%
#__inference_signature_wrapper_37429
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?

StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename*embedding_2/embeddings/Read/ReadVariableOp*embedding_3/embeddings/Read/ReadVariableOp"dense_2/kernel/Read/ReadVariableOp dense_2/bias/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp dense_3/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp1Adam/embedding_2/embeddings/m/Read/ReadVariableOp1Adam/embedding_3/embeddings/m/Read/ReadVariableOp)Adam/dense_2/kernel/m/Read/ReadVariableOp'Adam/dense_2/bias/m/Read/ReadVariableOp)Adam/dense_3/kernel/m/Read/ReadVariableOp'Adam/dense_3/bias/m/Read/ReadVariableOp1Adam/embedding_2/embeddings/v/Read/ReadVariableOp1Adam/embedding_3/embeddings/v/Read/ReadVariableOp)Adam/dense_2/kernel/v/Read/ReadVariableOp'Adam/dense_2/bias/v/Read/ReadVariableOp)Adam/dense_3/kernel/v/Read/ReadVariableOp'Adam/dense_3/bias/v/Read/ReadVariableOpConst*&
Tin
2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *'
f"R 
__inference__traced_save_37977
?
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameembedding_2/embeddingsembedding_3/embeddingsdense_2/kerneldense_2/biasdense_3/kerneldense_3/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcountAdam/embedding_2/embeddings/mAdam/embedding_3/embeddings/mAdam/dense_2/kernel/mAdam/dense_2/bias/mAdam/dense_3/kernel/mAdam/dense_3/bias/mAdam/embedding_2/embeddings/vAdam/embedding_3/embeddings/vAdam/dense_2/kernel/vAdam/dense_2/bias/vAdam/dense_3/kernel/vAdam/dense_3/bias/v*%
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? **
f%R#
!__inference__traced_restore_38062??
?
|
'__inference_dense_3_layer_call_fn_37820

inputs
unknown
	unknown_0
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_371582
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*.
_input_shapes
:?????????
::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?G
?
B__inference_model_1_layer_call_and_return_conditional_losses_37315

inputs
inputs_1
embedding_3_37278
embedding_2_37281
dense_2_37288
dense_2_37290
dense_3_37295
dense_3_37297
identity??dense_2/StatefulPartitionedCall?dense_3/StatefulPartitionedCall?!dropout_2/StatefulPartitionedCall?!dropout_3/StatefulPartitionedCall?#embedding_2/StatefulPartitionedCall?8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?#embedding_3/StatefulPartitionedCall?8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
#embedding_3/StatefulPartitionedCallStatefulPartitionedCallinputs_1embedding_3_37278*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_embedding_3_layer_call_and_return_conditional_losses_369532%
#embedding_3/StatefulPartitionedCall?
#embedding_2/StatefulPartitionedCallStatefulPartitionedCallinputsembedding_2_37281*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_embedding_2_layer_call_and_return_conditional_losses_369812%
#embedding_2/StatefulPartitionedCall?
reshape_2/PartitionedCallPartitionedCall,embedding_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_2_layer_call_and_return_conditional_losses_370052
reshape_2/PartitionedCall?
reshape_3/PartitionedCallPartitionedCall,embedding_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_3_layer_call_and_return_conditional_losses_370252
reshape_3/PartitionedCall?
concatenate_1/PartitionedCallPartitionedCall"reshape_2/PartitionedCall:output:0"reshape_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_concatenate_1_layer_call_and_return_conditional_losses_370402
concatenate_1/PartitionedCall?
!dropout_2/StatefulPartitionedCallStatefulPartitionedCall&concatenate_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_370612#
!dropout_2/StatefulPartitionedCall?
dense_2/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense_2_37288dense_2_37290*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_370892!
dense_2/StatefulPartitionedCall?
activation_2/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_activation_2_layer_call_and_return_conditional_losses_371102
activation_2/PartitionedCall?
!dropout_3/StatefulPartitionedCallStatefulPartitionedCall%activation_2/PartitionedCall:output:0"^dropout_2/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_371302#
!dropout_3/StatefulPartitionedCall?
dense_3/StatefulPartitionedCallStatefulPartitionedCall*dropout_3/StatefulPartitionedCall:output:0dense_3_37295dense_3_37297*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_371582!
dense_3/StatefulPartitionedCall?
activation_3/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_activation_3_layer_call_and_return_conditional_losses_371792
activation_3/PartitionedCall?
lambda_1/PartitionedCallPartitionedCall%activation_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_1_layer_call_and_return_conditional_losses_371952
lambda_1/PartitionedCall?
8embedding_2/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_2_37281*
_output_shapes
:	?2*
dtype02:
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_2/embeddings/Regularizer/SquareSquare@embedding_2/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?22+
)embedding_2/embeddings/Regularizer/Square?
(embedding_2/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_2/embeddings/Regularizer/Const?
&embedding_2/embeddings/Regularizer/SumSum-embedding_2/embeddings/Regularizer/Square:y:01embedding_2/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/Sum?
(embedding_2/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_2/embeddings/Regularizer/mul/x?
&embedding_2/embeddings/Regularizer/mulMul1embedding_2/embeddings/Regularizer/mul/x:output:0/embedding_2/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/mul?
8embedding_3/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_3_37278*
_output_shapes
:	?K2*
dtype02:
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_3/embeddings/Regularizer/SquareSquare@embedding_3/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?K22+
)embedding_3/embeddings/Regularizer/Square?
(embedding_3/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_3/embeddings/Regularizer/Const?
&embedding_3/embeddings/Regularizer/SumSum-embedding_3/embeddings/Regularizer/Square:y:01embedding_3/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/Sum?
(embedding_3/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_3/embeddings/Regularizer/mul/x?
&embedding_3/embeddings/Regularizer/mulMul1embedding_3/embeddings/Regularizer/mul/x:output:0/embedding_3/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/mul?
IdentityIdentity!lambda_1/PartitionedCall:output:0 ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall"^dropout_3/StatefulPartitionedCall$^embedding_2/StatefulPartitionedCall9^embedding_2/embeddings/Regularizer/Square/ReadVariableOp$^embedding_3/StatefulPartitionedCall9^embedding_3/embeddings/Regularizer/Square/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2F
!dropout_3/StatefulPartitionedCall!dropout_3/StatefulPartitionedCall2J
#embedding_2/StatefulPartitionedCall#embedding_2/StatefulPartitionedCall2t
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp8embedding_2/embeddings/Regularizer/Square/ReadVariableOp2J
#embedding_3/StatefulPartitionedCall#embedding_3/StatefulPartitionedCall2t
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp8embedding_3/embeddings/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?

`
D__inference_reshape_2_layer_call_and_return_conditional_losses_37683

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1?
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:?????????22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????2:S O
+
_output_shapes
:?????????2
 
_user_specified_nameinputs
?
b
)__inference_dropout_3_layer_call_fn_37796

inputs
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_371302
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????
2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????
22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?
?
__inference_loss_fn_1_37878E
Aembedding_3_embeddings_regularizer_square_readvariableop_resource
identity??8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
8embedding_3/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpAembedding_3_embeddings_regularizer_square_readvariableop_resource*
_output_shapes
:	?K2*
dtype02:
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_3/embeddings/Regularizer/SquareSquare@embedding_3/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?K22+
)embedding_3/embeddings/Regularizer/Square?
(embedding_3/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_3/embeddings/Regularizer/Const?
&embedding_3/embeddings/Regularizer/SumSum-embedding_3/embeddings/Regularizer/Square:y:01embedding_3/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/Sum?
(embedding_3/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_3/embeddings/Regularizer/mul/x?
&embedding_3/embeddings/Regularizer/mulMul1embedding_3/embeddings/Regularizer/mul/x:output:0/embedding_3/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/mul?
IdentityIdentity*embedding_3/embeddings/Regularizer/mul:z:09^embedding_3/embeddings/Regularizer/Square/ReadVariableOp*
T0*
_output_shapes
: 2

Identity"
identityIdentity:output:0*
_input_shapes
:2t
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp8embedding_3/embeddings/Regularizer/Square/ReadVariableOp
?	
?
B__inference_dense_2_layer_call_and_return_conditional_losses_37755

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:d
*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
2	
BiasAdd?
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????
2

Identity"
identityIdentity:output:0*.
_input_shapes
:?????????d::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
t
H__inference_concatenate_1_layer_call_and_return_conditional_losses_37712
inputs_0
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis?
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:?????????d2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:?????????d2

Identity"
identityIdentity:output:0*9
_input_shapes(
&:?????????2:?????????2:Q M
'
_output_shapes
:?????????2
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????2
"
_user_specified_name
inputs/1
?Z
?
B__inference_model_1_layer_call_and_return_conditional_losses_37577
inputs_0
inputs_1&
"embedding_3_embedding_lookup_37515&
"embedding_2_embedding_lookup_37521*
&dense_2_matmul_readvariableop_resource+
'dense_2_biasadd_readvariableop_resource*
&dense_3_matmul_readvariableop_resource+
'dense_3_biasadd_readvariableop_resource
identity??dense_2/BiasAdd/ReadVariableOp?dense_2/MatMul/ReadVariableOp?dense_3/BiasAdd/ReadVariableOp?dense_3/MatMul/ReadVariableOp?embedding_2/embedding_lookup?8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?embedding_3/embedding_lookup?8embedding_3/embeddings/Regularizer/Square/ReadVariableOpw
embedding_3/CastCastinputs_1*

DstT0*

SrcT0*'
_output_shapes
:?????????2
embedding_3/Cast?
embedding_3/embedding_lookupResourceGather"embedding_3_embedding_lookup_37515embedding_3/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*5
_class+
)'loc:@embedding_3/embedding_lookup/37515*+
_output_shapes
:?????????2*
dtype02
embedding_3/embedding_lookup?
%embedding_3/embedding_lookup/IdentityIdentity%embedding_3/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*5
_class+
)'loc:@embedding_3/embedding_lookup/37515*+
_output_shapes
:?????????22'
%embedding_3/embedding_lookup/Identity?
'embedding_3/embedding_lookup/Identity_1Identity.embedding_3/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:?????????22)
'embedding_3/embedding_lookup/Identity_1w
embedding_2/CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:?????????2
embedding_2/Cast?
embedding_2/embedding_lookupResourceGather"embedding_2_embedding_lookup_37521embedding_2/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*5
_class+
)'loc:@embedding_2/embedding_lookup/37521*+
_output_shapes
:?????????2*
dtype02
embedding_2/embedding_lookup?
%embedding_2/embedding_lookup/IdentityIdentity%embedding_2/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*5
_class+
)'loc:@embedding_2/embedding_lookup/37521*+
_output_shapes
:?????????22'
%embedding_2/embedding_lookup/Identity?
'embedding_2/embedding_lookup/Identity_1Identity.embedding_2/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:?????????22)
'embedding_2/embedding_lookup/Identity_1?
reshape_2/ShapeShape0embedding_2/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_2/Shape?
reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_2/strided_slice/stack?
reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_1?
reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_2?
reshape_2/strided_sliceStridedSlicereshape_2/Shape:output:0&reshape_2/strided_slice/stack:output:0(reshape_2/strided_slice/stack_1:output:0(reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_2/strided_slicex
reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
reshape_2/Reshape/shape/1?
reshape_2/Reshape/shapePack reshape_2/strided_slice:output:0"reshape_2/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_2/Reshape/shape?
reshape_2/ReshapeReshape0embedding_2/embedding_lookup/Identity_1:output:0 reshape_2/Reshape/shape:output:0*
T0*'
_output_shapes
:?????????22
reshape_2/Reshape?
reshape_3/ShapeShape0embedding_3/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_3/Shape?
reshape_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_3/strided_slice/stack?
reshape_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_3/strided_slice/stack_1?
reshape_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_3/strided_slice/stack_2?
reshape_3/strided_sliceStridedSlicereshape_3/Shape:output:0&reshape_3/strided_slice/stack:output:0(reshape_3/strided_slice/stack_1:output:0(reshape_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_3/strided_slicex
reshape_3/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
reshape_3/Reshape/shape/1?
reshape_3/Reshape/shapePack reshape_3/strided_slice:output:0"reshape_3/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_3/Reshape/shape?
reshape_3/ReshapeReshape0embedding_3/embedding_lookup/Identity_1:output:0 reshape_3/Reshape/shape:output:0*
T0*'
_output_shapes
:?????????22
reshape_3/Reshapex
concatenate_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate_1/concat/axis?
concatenate_1/concatConcatV2reshape_2/Reshape:output:0reshape_3/Reshape:output:0"concatenate_1/concat/axis:output:0*
N*
T0*'
_output_shapes
:?????????d2
concatenate_1/concat?
dropout_2/IdentityIdentityconcatenate_1/concat:output:0*
T0*'
_output_shapes
:?????????d2
dropout_2/Identity?
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes

:d
*
dtype02
dense_2/MatMul/ReadVariableOp?
dense_2/MatMulMatMuldropout_2/Identity:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
2
dense_2/MatMul?
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype02 
dense_2/BiasAdd/ReadVariableOp?
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
2
dense_2/BiasAddz
activation_2/ReluReludense_2/BiasAdd:output:0*
T0*'
_output_shapes
:?????????
2
activation_2/Relu?
dropout_3/IdentityIdentityactivation_2/Relu:activations:0*
T0*'
_output_shapes
:?????????
2
dropout_3/Identity?
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes

:
*
dtype02
dense_3/MatMul/ReadVariableOp?
dense_3/MatMulMatMuldropout_3/Identity:output:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
dense_3/MatMul?
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02 
dense_3/BiasAdd/ReadVariableOp?
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
dense_3/BiasAdd?
activation_3/SigmoidSigmoiddense_3/BiasAdd:output:0*
T0*'
_output_shapes
:?????????2
activation_3/Sigmoide
lambda_1/mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?@2
lambda_1/mul/y?
lambda_1/mulMulactivation_3/Sigmoid:y:0lambda_1/mul/y:output:0*
T0*'
_output_shapes
:?????????2
lambda_1/mule
lambda_1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
lambda_1/add/y?
lambda_1/addAddV2lambda_1/mul:z:0lambda_1/add/y:output:0*
T0*'
_output_shapes
:?????????2
lambda_1/add?
8embedding_2/embeddings/Regularizer/Square/ReadVariableOpReadVariableOp"embedding_2_embedding_lookup_37521*
_output_shapes
:	?2*
dtype02:
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_2/embeddings/Regularizer/SquareSquare@embedding_2/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?22+
)embedding_2/embeddings/Regularizer/Square?
(embedding_2/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_2/embeddings/Regularizer/Const?
&embedding_2/embeddings/Regularizer/SumSum-embedding_2/embeddings/Regularizer/Square:y:01embedding_2/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/Sum?
(embedding_2/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_2/embeddings/Regularizer/mul/x?
&embedding_2/embeddings/Regularizer/mulMul1embedding_2/embeddings/Regularizer/mul/x:output:0/embedding_2/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/mul?
8embedding_3/embeddings/Regularizer/Square/ReadVariableOpReadVariableOp"embedding_3_embedding_lookup_37515*
_output_shapes
:	?K2*
dtype02:
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_3/embeddings/Regularizer/SquareSquare@embedding_3/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?K22+
)embedding_3/embeddings/Regularizer/Square?
(embedding_3/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_3/embeddings/Regularizer/Const?
&embedding_3/embeddings/Regularizer/SumSum-embedding_3/embeddings/Regularizer/Square:y:01embedding_3/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/Sum?
(embedding_3/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_3/embeddings/Regularizer/mul/x?
&embedding_3/embeddings/Regularizer/mulMul1embedding_3/embeddings/Regularizer/mul/x:output:0/embedding_3/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/mul?
IdentityIdentitylambda_1/add:z:0^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp^embedding_2/embedding_lookup9^embedding_2/embeddings/Regularizer/Square/ReadVariableOp^embedding_3/embedding_lookup9^embedding_3/embeddings/Regularizer/Square/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2<
embedding_2/embedding_lookupembedding_2/embedding_lookup2t
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp8embedding_2/embeddings/Regularizer/Square/ReadVariableOp2<
embedding_3/embedding_lookupembedding_3/embedding_lookup2t
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp8embedding_3/embeddings/Regularizer/Square/ReadVariableOp:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/1
?D
?
B__inference_model_1_layer_call_and_return_conditional_losses_37270
input_3
input_4
embedding_3_37233
embedding_2_37236
dense_2_37243
dense_2_37245
dense_3_37250
dense_3_37252
identity??dense_2/StatefulPartitionedCall?dense_3/StatefulPartitionedCall?#embedding_2/StatefulPartitionedCall?8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?#embedding_3/StatefulPartitionedCall?8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
#embedding_3/StatefulPartitionedCallStatefulPartitionedCallinput_4embedding_3_37233*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_embedding_3_layer_call_and_return_conditional_losses_369532%
#embedding_3/StatefulPartitionedCall?
#embedding_2/StatefulPartitionedCallStatefulPartitionedCallinput_3embedding_2_37236*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_embedding_2_layer_call_and_return_conditional_losses_369812%
#embedding_2/StatefulPartitionedCall?
reshape_2/PartitionedCallPartitionedCall,embedding_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_2_layer_call_and_return_conditional_losses_370052
reshape_2/PartitionedCall?
reshape_3/PartitionedCallPartitionedCall,embedding_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_3_layer_call_and_return_conditional_losses_370252
reshape_3/PartitionedCall?
concatenate_1/PartitionedCallPartitionedCall"reshape_2/PartitionedCall:output:0"reshape_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_concatenate_1_layer_call_and_return_conditional_losses_370402
concatenate_1/PartitionedCall?
dropout_2/PartitionedCallPartitionedCall&concatenate_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_370662
dropout_2/PartitionedCall?
dense_2/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense_2_37243dense_2_37245*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_370892!
dense_2/StatefulPartitionedCall?
activation_2/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_activation_2_layer_call_and_return_conditional_losses_371102
activation_2/PartitionedCall?
dropout_3/PartitionedCallPartitionedCall%activation_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_371352
dropout_3/PartitionedCall?
dense_3/StatefulPartitionedCallStatefulPartitionedCall"dropout_3/PartitionedCall:output:0dense_3_37250dense_3_37252*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_371582!
dense_3/StatefulPartitionedCall?
activation_3/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_activation_3_layer_call_and_return_conditional_losses_371792
activation_3/PartitionedCall?
lambda_1/PartitionedCallPartitionedCall%activation_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_1_layer_call_and_return_conditional_losses_372032
lambda_1/PartitionedCall?
8embedding_2/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_2_37236*
_output_shapes
:	?2*
dtype02:
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_2/embeddings/Regularizer/SquareSquare@embedding_2/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?22+
)embedding_2/embeddings/Regularizer/Square?
(embedding_2/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_2/embeddings/Regularizer/Const?
&embedding_2/embeddings/Regularizer/SumSum-embedding_2/embeddings/Regularizer/Square:y:01embedding_2/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/Sum?
(embedding_2/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_2/embeddings/Regularizer/mul/x?
&embedding_2/embeddings/Regularizer/mulMul1embedding_2/embeddings/Regularizer/mul/x:output:0/embedding_2/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/mul?
8embedding_3/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_3_37233*
_output_shapes
:	?K2*
dtype02:
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_3/embeddings/Regularizer/SquareSquare@embedding_3/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?K22+
)embedding_3/embeddings/Regularizer/Square?
(embedding_3/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_3/embeddings/Regularizer/Const?
&embedding_3/embeddings/Regularizer/SumSum-embedding_3/embeddings/Regularizer/Square:y:01embedding_3/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/Sum?
(embedding_3/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_3/embeddings/Regularizer/mul/x?
&embedding_3/embeddings/Regularizer/mulMul1embedding_3/embeddings/Regularizer/mul/x:output:0/embedding_3/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/mul?
IdentityIdentity!lambda_1/PartitionedCall:output:0 ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall$^embedding_2/StatefulPartitionedCall9^embedding_2/embeddings/Regularizer/Square/ReadVariableOp$^embedding_3/StatefulPartitionedCall9^embedding_3/embeddings/Regularizer/Square/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2J
#embedding_2/StatefulPartitionedCall#embedding_2/StatefulPartitionedCall2t
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp8embedding_2/embeddings/Regularizer/Square/ReadVariableOp2J
#embedding_3/StatefulPartitionedCall#embedding_3/StatefulPartitionedCall2t
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp8embedding_3/embeddings/Regularizer/Square/ReadVariableOp:P L
'
_output_shapes
:?????????
!
_user_specified_name	input_3:PL
'
_output_shapes
:?????????
!
_user_specified_name	input_4
?
Y
-__inference_concatenate_1_layer_call_fn_37718
inputs_0
inputs_1
identity?
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_concatenate_1_layer_call_and_return_conditional_losses_370402
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:?????????d2

Identity"
identityIdentity:output:0*9
_input_shapes(
&:?????????2:?????????2:Q M
'
_output_shapes
:?????????2
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????2
"
_user_specified_name
inputs/1
?
c
D__inference_dropout_2_layer_call_and_return_conditional_losses_37730

inputs
identity?c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *????2
dropout/Consts
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:?????????d2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:?????????d*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *??L=2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????d2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????d2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:?????????d2
dropout/Mul_1e
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????d2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????d:O K
'
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
D
(__inference_lambda_1_layer_call_fn_37856

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_1_layer_call_and_return_conditional_losses_372032
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
D
(__inference_lambda_1_layer_call_fn_37851

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_1_layer_call_and_return_conditional_losses_371952
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?

`
D__inference_reshape_3_layer_call_and_return_conditional_losses_37025

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1?
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:?????????22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????2:S O
+
_output_shapes
:?????????2
 
_user_specified_nameinputs
?
?
F__inference_embedding_2_layer_call_and_return_conditional_losses_37635

inputs
embedding_lookup_37623
identity??8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?embedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:?????????2
Cast?
embedding_lookupResourceGatherembedding_lookup_37623Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/37623*+
_output_shapes
:?????????2*
dtype02
embedding_lookup?
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/37623*+
_output_shapes
:?????????22
embedding_lookup/Identity?
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:?????????22
embedding_lookup/Identity_1?
8embedding_2/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_lookup_37623*
_output_shapes
:	?2*
dtype02:
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_2/embeddings/Regularizer/SquareSquare@embedding_2/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?22+
)embedding_2/embeddings/Regularizer/Square?
(embedding_2/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_2/embeddings/Regularizer/Const?
&embedding_2/embeddings/Regularizer/SumSum-embedding_2/embeddings/Regularizer/Square:y:01embedding_2/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/Sum?
(embedding_2/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_2/embeddings/Regularizer/mul/x?
&embedding_2/embeddings/Regularizer/mulMul1embedding_2/embeddings/Regularizer/mul/x:output:0/embedding_2/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/mul?
IdentityIdentity$embedding_lookup/Identity_1:output:09^embedding_2/embeddings/Regularizer/Square/ReadVariableOp^embedding_lookup*
T0*+
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????:2t
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp8embedding_2/embeddings/Regularizer/Square/ReadVariableOp2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
c
D__inference_dropout_2_layer_call_and_return_conditional_losses_37061

inputs
identity?c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *????2
dropout/Consts
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:?????????d2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:?????????d*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *??L=2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????d2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????d2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:?????????d2
dropout/Mul_1e
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????d2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????d:O K
'
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
c
G__inference_activation_2_layer_call_and_return_conditional_losses_37769

inputs
identityN
ReluReluinputs*
T0*'
_output_shapes
:?????????
2
Reluf
IdentityIdentityRelu:activations:0*
T0*'
_output_shapes
:?????????
2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????
:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?
?
'__inference_model_1_layer_call_fn_37389
input_3
input_4
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_3input_4unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_model_1_layer_call_and_return_conditional_losses_373742
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::22
StatefulPartitionedCallStatefulPartitionedCall:P L
'
_output_shapes
:?????????
!
_user_specified_name	input_3:PL
'
_output_shapes
:?????????
!
_user_specified_name	input_4
?	
?
B__inference_dense_3_layer_call_and_return_conditional_losses_37811

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:
*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2	
BiasAdd?
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*.
_input_shapes
:?????????
::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?
H
,__inference_activation_2_layer_call_fn_37774

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_activation_2_layer_call_and_return_conditional_losses_371102
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:?????????
2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????
:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?
?
F__inference_embedding_3_layer_call_and_return_conditional_losses_37664

inputs
embedding_lookup_37652
identity??8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?embedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:?????????2
Cast?
embedding_lookupResourceGatherembedding_lookup_37652Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/37652*+
_output_shapes
:?????????2*
dtype02
embedding_lookup?
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/37652*+
_output_shapes
:?????????22
embedding_lookup/Identity?
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:?????????22
embedding_lookup/Identity_1?
8embedding_3/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_lookup_37652*
_output_shapes
:	?K2*
dtype02:
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_3/embeddings/Regularizer/SquareSquare@embedding_3/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?K22+
)embedding_3/embeddings/Regularizer/Square?
(embedding_3/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_3/embeddings/Regularizer/Const?
&embedding_3/embeddings/Regularizer/SumSum-embedding_3/embeddings/Regularizer/Square:y:01embedding_3/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/Sum?
(embedding_3/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_3/embeddings/Regularizer/mul/x?
&embedding_3/embeddings/Regularizer/mulMul1embedding_3/embeddings/Regularizer/mul/x:output:0/embedding_3/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/mul?
IdentityIdentity$embedding_lookup/Identity_1:output:09^embedding_3/embeddings/Regularizer/Square/ReadVariableOp^embedding_lookup*
T0*+
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????:2t
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp8embedding_3/embeddings/Regularizer/Square/ReadVariableOp2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?l
?
!__inference__traced_restore_38062
file_prefix+
'assignvariableop_embedding_2_embeddings-
)assignvariableop_1_embedding_3_embeddings%
!assignvariableop_2_dense_2_kernel#
assignvariableop_3_dense_2_bias%
!assignvariableop_4_dense_3_kernel#
assignvariableop_5_dense_3_bias 
assignvariableop_6_adam_iter"
assignvariableop_7_adam_beta_1"
assignvariableop_8_adam_beta_2!
assignvariableop_9_adam_decay*
&assignvariableop_10_adam_learning_rate
assignvariableop_11_total
assignvariableop_12_count5
1assignvariableop_13_adam_embedding_2_embeddings_m5
1assignvariableop_14_adam_embedding_3_embeddings_m-
)assignvariableop_15_adam_dense_2_kernel_m+
'assignvariableop_16_adam_dense_2_bias_m-
)assignvariableop_17_adam_dense_3_kernel_m+
'assignvariableop_18_adam_dense_3_bias_m5
1assignvariableop_19_adam_embedding_2_embeddings_v5
1assignvariableop_20_adam_embedding_3_embeddings_v-
)assignvariableop_21_adam_dense_2_kernel_v+
'assignvariableop_22_adam_dense_2_bias_v-
)assignvariableop_23_adam_dense_3_kernel_v+
'assignvariableop_24_adam_dense_3_bias_v
identity_26??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_11?AssignVariableOp_12?AssignVariableOp_13?AssignVariableOp_14?AssignVariableOp_15?AssignVariableOp_16?AssignVariableOp_17?AssignVariableOp_18?AssignVariableOp_19?AssignVariableOp_2?AssignVariableOp_20?AssignVariableOp_21?AssignVariableOp_22?AssignVariableOp_23?AssignVariableOp_24?AssignVariableOp_3?AssignVariableOp_4?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*G
value>B<B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*|
_output_shapesj
h::::::::::::::::::::::::::*(
dtypes
2	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity?
AssignVariableOpAssignVariableOp'assignvariableop_embedding_2_embeddingsIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1?
AssignVariableOp_1AssignVariableOp)assignvariableop_1_embedding_3_embeddingsIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2?
AssignVariableOp_2AssignVariableOp!assignvariableop_2_dense_2_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3?
AssignVariableOp_3AssignVariableOpassignvariableop_3_dense_2_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4?
AssignVariableOp_4AssignVariableOp!assignvariableop_4_dense_3_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5?
AssignVariableOp_5AssignVariableOpassignvariableop_5_dense_3_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0	*
_output_shapes
:2

Identity_6?
AssignVariableOp_6AssignVariableOpassignvariableop_6_adam_iterIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7?
AssignVariableOp_7AssignVariableOpassignvariableop_7_adam_beta_1Identity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8?
AssignVariableOp_8AssignVariableOpassignvariableop_8_adam_beta_2Identity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9?
AssignVariableOp_9AssignVariableOpassignvariableop_9_adam_decayIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10?
AssignVariableOp_10AssignVariableOp&assignvariableop_10_adam_learning_rateIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11?
AssignVariableOp_11AssignVariableOpassignvariableop_11_totalIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12?
AssignVariableOp_12AssignVariableOpassignvariableop_12_countIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13?
AssignVariableOp_13AssignVariableOp1assignvariableop_13_adam_embedding_2_embeddings_mIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14?
AssignVariableOp_14AssignVariableOp1assignvariableop_14_adam_embedding_3_embeddings_mIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15?
AssignVariableOp_15AssignVariableOp)assignvariableop_15_adam_dense_2_kernel_mIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16?
AssignVariableOp_16AssignVariableOp'assignvariableop_16_adam_dense_2_bias_mIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17?
AssignVariableOp_17AssignVariableOp)assignvariableop_17_adam_dense_3_kernel_mIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:2
Identity_18?
AssignVariableOp_18AssignVariableOp'assignvariableop_18_adam_dense_3_bias_mIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19?
AssignVariableOp_19AssignVariableOp1assignvariableop_19_adam_embedding_2_embeddings_vIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20?
AssignVariableOp_20AssignVariableOp1assignvariableop_20_adam_embedding_3_embeddings_vIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21?
AssignVariableOp_21AssignVariableOp)assignvariableop_21_adam_dense_2_kernel_vIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22?
AssignVariableOp_22AssignVariableOp'assignvariableop_22_adam_dense_2_bias_vIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23?
AssignVariableOp_23AssignVariableOp)assignvariableop_23_adam_dense_3_kernel_vIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24?
AssignVariableOp_24AssignVariableOp'assignvariableop_24_adam_dense_3_bias_vIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_249
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp?
Identity_25Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_25?
Identity_26IdentityIdentity_25:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_26"#
identity_26Identity_26:output:0*y
_input_shapesh
f: :::::::::::::::::::::::::2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
?D
?
B__inference_model_1_layer_call_and_return_conditional_losses_37374

inputs
inputs_1
embedding_3_37337
embedding_2_37340
dense_2_37347
dense_2_37349
dense_3_37354
dense_3_37356
identity??dense_2/StatefulPartitionedCall?dense_3/StatefulPartitionedCall?#embedding_2/StatefulPartitionedCall?8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?#embedding_3/StatefulPartitionedCall?8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
#embedding_3/StatefulPartitionedCallStatefulPartitionedCallinputs_1embedding_3_37337*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_embedding_3_layer_call_and_return_conditional_losses_369532%
#embedding_3/StatefulPartitionedCall?
#embedding_2/StatefulPartitionedCallStatefulPartitionedCallinputsembedding_2_37340*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_embedding_2_layer_call_and_return_conditional_losses_369812%
#embedding_2/StatefulPartitionedCall?
reshape_2/PartitionedCallPartitionedCall,embedding_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_2_layer_call_and_return_conditional_losses_370052
reshape_2/PartitionedCall?
reshape_3/PartitionedCallPartitionedCall,embedding_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_3_layer_call_and_return_conditional_losses_370252
reshape_3/PartitionedCall?
concatenate_1/PartitionedCallPartitionedCall"reshape_2/PartitionedCall:output:0"reshape_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_concatenate_1_layer_call_and_return_conditional_losses_370402
concatenate_1/PartitionedCall?
dropout_2/PartitionedCallPartitionedCall&concatenate_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_370662
dropout_2/PartitionedCall?
dense_2/StatefulPartitionedCallStatefulPartitionedCall"dropout_2/PartitionedCall:output:0dense_2_37347dense_2_37349*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_370892!
dense_2/StatefulPartitionedCall?
activation_2/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_activation_2_layer_call_and_return_conditional_losses_371102
activation_2/PartitionedCall?
dropout_3/PartitionedCallPartitionedCall%activation_2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_371352
dropout_3/PartitionedCall?
dense_3/StatefulPartitionedCallStatefulPartitionedCall"dropout_3/PartitionedCall:output:0dense_3_37354dense_3_37356*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_371582!
dense_3/StatefulPartitionedCall?
activation_3/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_activation_3_layer_call_and_return_conditional_losses_371792
activation_3/PartitionedCall?
lambda_1/PartitionedCallPartitionedCall%activation_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_1_layer_call_and_return_conditional_losses_372032
lambda_1/PartitionedCall?
8embedding_2/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_2_37340*
_output_shapes
:	?2*
dtype02:
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_2/embeddings/Regularizer/SquareSquare@embedding_2/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?22+
)embedding_2/embeddings/Regularizer/Square?
(embedding_2/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_2/embeddings/Regularizer/Const?
&embedding_2/embeddings/Regularizer/SumSum-embedding_2/embeddings/Regularizer/Square:y:01embedding_2/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/Sum?
(embedding_2/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_2/embeddings/Regularizer/mul/x?
&embedding_2/embeddings/Regularizer/mulMul1embedding_2/embeddings/Regularizer/mul/x:output:0/embedding_2/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/mul?
8embedding_3/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_3_37337*
_output_shapes
:	?K2*
dtype02:
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_3/embeddings/Regularizer/SquareSquare@embedding_3/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?K22+
)embedding_3/embeddings/Regularizer/Square?
(embedding_3/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_3/embeddings/Regularizer/Const?
&embedding_3/embeddings/Regularizer/SumSum-embedding_3/embeddings/Regularizer/Square:y:01embedding_3/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/Sum?
(embedding_3/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_3/embeddings/Regularizer/mul/x?
&embedding_3/embeddings/Regularizer/mulMul1embedding_3/embeddings/Regularizer/mul/x:output:0/embedding_3/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/mul?
IdentityIdentity!lambda_1/PartitionedCall:output:0 ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall$^embedding_2/StatefulPartitionedCall9^embedding_2/embeddings/Regularizer/Square/ReadVariableOp$^embedding_3/StatefulPartitionedCall9^embedding_3/embeddings/Regularizer/Square/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2J
#embedding_2/StatefulPartitionedCall#embedding_2/StatefulPartitionedCall2t
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp8embedding_2/embeddings/Regularizer/Square/ReadVariableOp2J
#embedding_3/StatefulPartitionedCall#embedding_3/StatefulPartitionedCall2t
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp8embedding_3/embeddings/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
c
D__inference_dropout_3_layer_call_and_return_conditional_losses_37786

inputs
identity?c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/Consts
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:?????????
2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:?????????
*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????
2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????
2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:?????????
2
dropout/Mul_1e
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????
2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????
:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?
b
D__inference_dropout_2_layer_call_and_return_conditional_losses_37066

inputs

identity_1Z
IdentityIdentityinputs*
T0*'
_output_shapes
:?????????d2

Identityi

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:?????????d2

Identity_1"!

identity_1Identity_1:output:0*&
_input_shapes
:?????????d:O K
'
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
_
C__inference_lambda_1_layer_call_and_return_conditional_losses_37195

inputs
identityS
mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?@2
mul/y[
mulMulinputsmul/y:output:0*
T0*'
_output_shapes
:?????????2
mulS
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
add/y^
addAddV2mul:z:0add/y:output:0*
T0*'
_output_shapes
:?????????2
add[
IdentityIdentityadd:z:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
'__inference_model_1_layer_call_fn_37330
input_3
input_4
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_3input_4unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_model_1_layer_call_and_return_conditional_losses_373152
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::22
StatefulPartitionedCallStatefulPartitionedCall:P L
'
_output_shapes
:?????????
!
_user_specified_name	input_3:PL
'
_output_shapes
:?????????
!
_user_specified_name	input_4
?
q
+__inference_embedding_3_layer_call_fn_37671

inputs
unknown
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_embedding_3_layer_call_and_return_conditional_losses_369532
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????:22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?	
?
B__inference_dense_3_layer_call_and_return_conditional_losses_37158

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:
*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2	
BiasAdd?
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*.
_input_shapes
:?????????
::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?
r
H__inference_concatenate_1_layer_call_and_return_conditional_losses_37040

inputs
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:?????????d2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:?????????d2

Identity"
identityIdentity:output:0*9
_input_shapes(
&:?????????2:?????????2:O K
'
_output_shapes
:?????????2
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????2
 
_user_specified_nameinputs
?
E
)__inference_dropout_2_layer_call_fn_37745

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_370662
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:?????????d2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????d:O K
'
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
H
,__inference_activation_3_layer_call_fn_37830

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_activation_3_layer_call_and_return_conditional_losses_371792
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
F__inference_embedding_2_layer_call_and_return_conditional_losses_36981

inputs
embedding_lookup_36969
identity??8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?embedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:?????????2
Cast?
embedding_lookupResourceGatherembedding_lookup_36969Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/36969*+
_output_shapes
:?????????2*
dtype02
embedding_lookup?
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/36969*+
_output_shapes
:?????????22
embedding_lookup/Identity?
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:?????????22
embedding_lookup/Identity_1?
8embedding_2/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_lookup_36969*
_output_shapes
:	?2*
dtype02:
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_2/embeddings/Regularizer/SquareSquare@embedding_2/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?22+
)embedding_2/embeddings/Regularizer/Square?
(embedding_2/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_2/embeddings/Regularizer/Const?
&embedding_2/embeddings/Regularizer/SumSum-embedding_2/embeddings/Regularizer/Square:y:01embedding_2/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/Sum?
(embedding_2/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_2/embeddings/Regularizer/mul/x?
&embedding_2/embeddings/Regularizer/mulMul1embedding_2/embeddings/Regularizer/mul/x:output:0/embedding_2/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/mul?
IdentityIdentity$embedding_lookup/Identity_1:output:09^embedding_2/embeddings/Regularizer/Square/ReadVariableOp^embedding_lookup*
T0*+
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????:2t
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp8embedding_2/embeddings/Regularizer/Square/ReadVariableOp2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?N
?
 __inference__wrapped_model_36932
input_3
input_4.
*model_1_embedding_3_embedding_lookup_36882.
*model_1_embedding_2_embedding_lookup_368882
.model_1_dense_2_matmul_readvariableop_resource3
/model_1_dense_2_biasadd_readvariableop_resource2
.model_1_dense_3_matmul_readvariableop_resource3
/model_1_dense_3_biasadd_readvariableop_resource
identity??&model_1/dense_2/BiasAdd/ReadVariableOp?%model_1/dense_2/MatMul/ReadVariableOp?&model_1/dense_3/BiasAdd/ReadVariableOp?%model_1/dense_3/MatMul/ReadVariableOp?$model_1/embedding_2/embedding_lookup?$model_1/embedding_3/embedding_lookup?
model_1/embedding_3/CastCastinput_4*

DstT0*

SrcT0*'
_output_shapes
:?????????2
model_1/embedding_3/Cast?
$model_1/embedding_3/embedding_lookupResourceGather*model_1_embedding_3_embedding_lookup_36882model_1/embedding_3/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*=
_class3
1/loc:@model_1/embedding_3/embedding_lookup/36882*+
_output_shapes
:?????????2*
dtype02&
$model_1/embedding_3/embedding_lookup?
-model_1/embedding_3/embedding_lookup/IdentityIdentity-model_1/embedding_3/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*=
_class3
1/loc:@model_1/embedding_3/embedding_lookup/36882*+
_output_shapes
:?????????22/
-model_1/embedding_3/embedding_lookup/Identity?
/model_1/embedding_3/embedding_lookup/Identity_1Identity6model_1/embedding_3/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:?????????221
/model_1/embedding_3/embedding_lookup/Identity_1?
model_1/embedding_2/CastCastinput_3*

DstT0*

SrcT0*'
_output_shapes
:?????????2
model_1/embedding_2/Cast?
$model_1/embedding_2/embedding_lookupResourceGather*model_1_embedding_2_embedding_lookup_36888model_1/embedding_2/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*=
_class3
1/loc:@model_1/embedding_2/embedding_lookup/36888*+
_output_shapes
:?????????2*
dtype02&
$model_1/embedding_2/embedding_lookup?
-model_1/embedding_2/embedding_lookup/IdentityIdentity-model_1/embedding_2/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*=
_class3
1/loc:@model_1/embedding_2/embedding_lookup/36888*+
_output_shapes
:?????????22/
-model_1/embedding_2/embedding_lookup/Identity?
/model_1/embedding_2/embedding_lookup/Identity_1Identity6model_1/embedding_2/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:?????????221
/model_1/embedding_2/embedding_lookup/Identity_1?
model_1/reshape_2/ShapeShape8model_1/embedding_2/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
model_1/reshape_2/Shape?
%model_1/reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%model_1/reshape_2/strided_slice/stack?
'model_1/reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_2/strided_slice/stack_1?
'model_1/reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_2/strided_slice/stack_2?
model_1/reshape_2/strided_sliceStridedSlice model_1/reshape_2/Shape:output:0.model_1/reshape_2/strided_slice/stack:output:00model_1/reshape_2/strided_slice/stack_1:output:00model_1/reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2!
model_1/reshape_2/strided_slice?
!model_1/reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22#
!model_1/reshape_2/Reshape/shape/1?
model_1/reshape_2/Reshape/shapePack(model_1/reshape_2/strided_slice:output:0*model_1/reshape_2/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2!
model_1/reshape_2/Reshape/shape?
model_1/reshape_2/ReshapeReshape8model_1/embedding_2/embedding_lookup/Identity_1:output:0(model_1/reshape_2/Reshape/shape:output:0*
T0*'
_output_shapes
:?????????22
model_1/reshape_2/Reshape?
model_1/reshape_3/ShapeShape8model_1/embedding_3/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
model_1/reshape_3/Shape?
%model_1/reshape_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2'
%model_1/reshape_3/strided_slice/stack?
'model_1/reshape_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_3/strided_slice/stack_1?
'model_1/reshape_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2)
'model_1/reshape_3/strided_slice/stack_2?
model_1/reshape_3/strided_sliceStridedSlice model_1/reshape_3/Shape:output:0.model_1/reshape_3/strided_slice/stack:output:00model_1/reshape_3/strided_slice/stack_1:output:00model_1/reshape_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2!
model_1/reshape_3/strided_slice?
!model_1/reshape_3/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22#
!model_1/reshape_3/Reshape/shape/1?
model_1/reshape_3/Reshape/shapePack(model_1/reshape_3/strided_slice:output:0*model_1/reshape_3/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2!
model_1/reshape_3/Reshape/shape?
model_1/reshape_3/ReshapeReshape8model_1/embedding_3/embedding_lookup/Identity_1:output:0(model_1/reshape_3/Reshape/shape:output:0*
T0*'
_output_shapes
:?????????22
model_1/reshape_3/Reshape?
!model_1/concatenate_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2#
!model_1/concatenate_1/concat/axis?
model_1/concatenate_1/concatConcatV2"model_1/reshape_2/Reshape:output:0"model_1/reshape_3/Reshape:output:0*model_1/concatenate_1/concat/axis:output:0*
N*
T0*'
_output_shapes
:?????????d2
model_1/concatenate_1/concat?
model_1/dropout_2/IdentityIdentity%model_1/concatenate_1/concat:output:0*
T0*'
_output_shapes
:?????????d2
model_1/dropout_2/Identity?
%model_1/dense_2/MatMul/ReadVariableOpReadVariableOp.model_1_dense_2_matmul_readvariableop_resource*
_output_shapes

:d
*
dtype02'
%model_1/dense_2/MatMul/ReadVariableOp?
model_1/dense_2/MatMulMatMul#model_1/dropout_2/Identity:output:0-model_1/dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
2
model_1/dense_2/MatMul?
&model_1/dense_2/BiasAdd/ReadVariableOpReadVariableOp/model_1_dense_2_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype02(
&model_1/dense_2/BiasAdd/ReadVariableOp?
model_1/dense_2/BiasAddBiasAdd model_1/dense_2/MatMul:product:0.model_1/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
2
model_1/dense_2/BiasAdd?
model_1/activation_2/ReluRelu model_1/dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:?????????
2
model_1/activation_2/Relu?
model_1/dropout_3/IdentityIdentity'model_1/activation_2/Relu:activations:0*
T0*'
_output_shapes
:?????????
2
model_1/dropout_3/Identity?
%model_1/dense_3/MatMul/ReadVariableOpReadVariableOp.model_1_dense_3_matmul_readvariableop_resource*
_output_shapes

:
*
dtype02'
%model_1/dense_3/MatMul/ReadVariableOp?
model_1/dense_3/MatMulMatMul#model_1/dropout_3/Identity:output:0-model_1/dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
model_1/dense_3/MatMul?
&model_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp/model_1_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02(
&model_1/dense_3/BiasAdd/ReadVariableOp?
model_1/dense_3/BiasAddBiasAdd model_1/dense_3/MatMul:product:0.model_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
model_1/dense_3/BiasAdd?
model_1/activation_3/SigmoidSigmoid model_1/dense_3/BiasAdd:output:0*
T0*'
_output_shapes
:?????????2
model_1/activation_3/Sigmoidu
model_1/lambda_1/mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?@2
model_1/lambda_1/mul/y?
model_1/lambda_1/mulMul model_1/activation_3/Sigmoid:y:0model_1/lambda_1/mul/y:output:0*
T0*'
_output_shapes
:?????????2
model_1/lambda_1/mulu
model_1/lambda_1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
model_1/lambda_1/add/y?
model_1/lambda_1/addAddV2model_1/lambda_1/mul:z:0model_1/lambda_1/add/y:output:0*
T0*'
_output_shapes
:?????????2
model_1/lambda_1/add?
IdentityIdentitymodel_1/lambda_1/add:z:0'^model_1/dense_2/BiasAdd/ReadVariableOp&^model_1/dense_2/MatMul/ReadVariableOp'^model_1/dense_3/BiasAdd/ReadVariableOp&^model_1/dense_3/MatMul/ReadVariableOp%^model_1/embedding_2/embedding_lookup%^model_1/embedding_3/embedding_lookup*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::2P
&model_1/dense_2/BiasAdd/ReadVariableOp&model_1/dense_2/BiasAdd/ReadVariableOp2N
%model_1/dense_2/MatMul/ReadVariableOp%model_1/dense_2/MatMul/ReadVariableOp2P
&model_1/dense_3/BiasAdd/ReadVariableOp&model_1/dense_3/BiasAdd/ReadVariableOp2N
%model_1/dense_3/MatMul/ReadVariableOp%model_1/dense_3/MatMul/ReadVariableOp2L
$model_1/embedding_2/embedding_lookup$model_1/embedding_2/embedding_lookup2L
$model_1/embedding_3/embedding_lookup$model_1/embedding_3/embedding_lookup:P L
'
_output_shapes
:?????????
!
_user_specified_name	input_3:PL
'
_output_shapes
:?????????
!
_user_specified_name	input_4
?
c
G__inference_activation_2_layer_call_and_return_conditional_losses_37110

inputs
identityN
ReluReluinputs*
T0*'
_output_shapes
:?????????
2
Reluf
IdentityIdentityRelu:activations:0*
T0*'
_output_shapes
:?????????
2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????
:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?
_
C__inference_lambda_1_layer_call_and_return_conditional_losses_37203

inputs
identityS
mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?@2
mul/y[
mulMulinputsmul/y:output:0*
T0*'
_output_shapes
:?????????2
mulS
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
add/y^
addAddV2mul:z:0add/y:output:0*
T0*'
_output_shapes
:?????????2
add[
IdentityIdentityadd:z:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
|
'__inference_dense_2_layer_call_fn_37764

inputs
unknown
	unknown_0
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_370892
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????
2

Identity"
identityIdentity:output:0*.
_input_shapes
:?????????d::22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
_
C__inference_lambda_1_layer_call_and_return_conditional_losses_37838

inputs
identityS
mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?@2
mul/y[
mulMulinputsmul/y:output:0*
T0*'
_output_shapes
:?????????2
mulS
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
add/y^
addAddV2mul:z:0add/y:output:0*
T0*'
_output_shapes
:?????????2
add[
IdentityIdentityadd:z:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?

`
D__inference_reshape_3_layer_call_and_return_conditional_losses_37700

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1?
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:?????????22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????2:S O
+
_output_shapes
:?????????2
 
_user_specified_nameinputs
?;
?

__inference__traced_save_37977
file_prefix5
1savev2_embedding_2_embeddings_read_readvariableop5
1savev2_embedding_3_embeddings_read_readvariableop-
)savev2_dense_2_kernel_read_readvariableop+
'savev2_dense_2_bias_read_readvariableop-
)savev2_dense_3_kernel_read_readvariableop+
'savev2_dense_3_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop<
8savev2_adam_embedding_2_embeddings_m_read_readvariableop<
8savev2_adam_embedding_3_embeddings_m_read_readvariableop4
0savev2_adam_dense_2_kernel_m_read_readvariableop2
.savev2_adam_dense_2_bias_m_read_readvariableop4
0savev2_adam_dense_3_kernel_m_read_readvariableop2
.savev2_adam_dense_3_bias_m_read_readvariableop<
8savev2_adam_embedding_2_embeddings_v_read_readvariableop<
8savev2_adam_embedding_3_embeddings_v_read_readvariableop4
0savev2_adam_dense_2_kernel_v_read_readvariableop2
.savev2_adam_dense_2_bias_v_read_readvariableop4
0savev2_adam_dense_3_kernel_v_read_readvariableop2
.savev2_adam_dense_3_bias_v_read_readvariableop
savev2_const

identity_1??MergeV2Checkpoints?
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename?
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B:layer_with_weights-0/embeddings/.ATTRIBUTES/VARIABLE_VALUEB:layer_with_weights-1/embeddings/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-0/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBVlayer_with_weights-1/embeddings/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*G
value>B<B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices?

SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:01savev2_embedding_2_embeddings_read_readvariableop1savev2_embedding_3_embeddings_read_readvariableop)savev2_dense_2_kernel_read_readvariableop'savev2_dense_2_bias_read_readvariableop)savev2_dense_3_kernel_read_readvariableop'savev2_dense_3_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop8savev2_adam_embedding_2_embeddings_m_read_readvariableop8savev2_adam_embedding_3_embeddings_m_read_readvariableop0savev2_adam_dense_2_kernel_m_read_readvariableop.savev2_adam_dense_2_bias_m_read_readvariableop0savev2_adam_dense_3_kernel_m_read_readvariableop.savev2_adam_dense_3_bias_m_read_readvariableop8savev2_adam_embedding_2_embeddings_v_read_readvariableop8savev2_adam_embedding_3_embeddings_v_read_readvariableop0savev2_adam_dense_2_kernel_v_read_readvariableop.savev2_adam_dense_2_bias_v_read_readvariableop0savev2_adam_dense_3_kernel_v_read_readvariableop.savev2_adam_dense_3_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *(
dtypes
2	2
SaveV2?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*?
_input_shapes?
?: :	?2:	?K2:d
:
:
:: : : : : : : :	?2:	?K2:d
:
:
::	?2:	?K2:d
:
:
:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	?2:%!

_output_shapes
:	?K2:$ 

_output_shapes

:d
: 

_output_shapes
:
:$ 

_output_shapes

:
: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :	

_output_shapes
: :


_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :%!

_output_shapes
:	?2:%!

_output_shapes
:	?K2:$ 

_output_shapes

:d
: 

_output_shapes
:
:$ 

_output_shapes

:
: 

_output_shapes
::%!

_output_shapes
:	?2:%!

_output_shapes
:	?K2:$ 

_output_shapes

:d
: 

_output_shapes
:
:$ 

_output_shapes

:
: 

_output_shapes
::

_output_shapes
: 
?
c
G__inference_activation_3_layer_call_and_return_conditional_losses_37179

inputs
identityW
SigmoidSigmoidinputs*
T0*'
_output_shapes
:?????????2	
Sigmoid_
IdentityIdentitySigmoid:y:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
E
)__inference_dropout_3_layer_call_fn_37801

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_371352
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:?????????
2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????
:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?
_
C__inference_lambda_1_layer_call_and_return_conditional_losses_37846

inputs
identityS
mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?@2
mul/y[
mulMulinputsmul/y:output:0*
T0*'
_output_shapes
:?????????2
mulS
add/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
add/y^
addAddV2mul:z:0add/y:output:0*
T0*'
_output_shapes
:?????????2
add[
IdentityIdentityadd:z:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?m
?
B__inference_model_1_layer_call_and_return_conditional_losses_37510
inputs_0
inputs_1&
"embedding_3_embedding_lookup_37434&
"embedding_2_embedding_lookup_37440*
&dense_2_matmul_readvariableop_resource+
'dense_2_biasadd_readvariableop_resource*
&dense_3_matmul_readvariableop_resource+
'dense_3_biasadd_readvariableop_resource
identity??dense_2/BiasAdd/ReadVariableOp?dense_2/MatMul/ReadVariableOp?dense_3/BiasAdd/ReadVariableOp?dense_3/MatMul/ReadVariableOp?embedding_2/embedding_lookup?8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?embedding_3/embedding_lookup?8embedding_3/embeddings/Regularizer/Square/ReadVariableOpw
embedding_3/CastCastinputs_1*

DstT0*

SrcT0*'
_output_shapes
:?????????2
embedding_3/Cast?
embedding_3/embedding_lookupResourceGather"embedding_3_embedding_lookup_37434embedding_3/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*5
_class+
)'loc:@embedding_3/embedding_lookup/37434*+
_output_shapes
:?????????2*
dtype02
embedding_3/embedding_lookup?
%embedding_3/embedding_lookup/IdentityIdentity%embedding_3/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*5
_class+
)'loc:@embedding_3/embedding_lookup/37434*+
_output_shapes
:?????????22'
%embedding_3/embedding_lookup/Identity?
'embedding_3/embedding_lookup/Identity_1Identity.embedding_3/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:?????????22)
'embedding_3/embedding_lookup/Identity_1w
embedding_2/CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:?????????2
embedding_2/Cast?
embedding_2/embedding_lookupResourceGather"embedding_2_embedding_lookup_37440embedding_2/Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*5
_class+
)'loc:@embedding_2/embedding_lookup/37440*+
_output_shapes
:?????????2*
dtype02
embedding_2/embedding_lookup?
%embedding_2/embedding_lookup/IdentityIdentity%embedding_2/embedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*5
_class+
)'loc:@embedding_2/embedding_lookup/37440*+
_output_shapes
:?????????22'
%embedding_2/embedding_lookup/Identity?
'embedding_2/embedding_lookup/Identity_1Identity.embedding_2/embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:?????????22)
'embedding_2/embedding_lookup/Identity_1?
reshape_2/ShapeShape0embedding_2/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_2/Shape?
reshape_2/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_2/strided_slice/stack?
reshape_2/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_1?
reshape_2/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_2/strided_slice/stack_2?
reshape_2/strided_sliceStridedSlicereshape_2/Shape:output:0&reshape_2/strided_slice/stack:output:0(reshape_2/strided_slice/stack_1:output:0(reshape_2/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_2/strided_slicex
reshape_2/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
reshape_2/Reshape/shape/1?
reshape_2/Reshape/shapePack reshape_2/strided_slice:output:0"reshape_2/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_2/Reshape/shape?
reshape_2/ReshapeReshape0embedding_2/embedding_lookup/Identity_1:output:0 reshape_2/Reshape/shape:output:0*
T0*'
_output_shapes
:?????????22
reshape_2/Reshape?
reshape_3/ShapeShape0embedding_3/embedding_lookup/Identity_1:output:0*
T0*
_output_shapes
:2
reshape_3/Shape?
reshape_3/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
reshape_3/strided_slice/stack?
reshape_3/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_3/strided_slice/stack_1?
reshape_3/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2!
reshape_3/strided_slice/stack_2?
reshape_3/strided_sliceStridedSlicereshape_3/Shape:output:0&reshape_3/strided_slice/stack:output:0(reshape_3/strided_slice/stack_1:output:0(reshape_3/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
reshape_3/strided_slicex
reshape_3/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
reshape_3/Reshape/shape/1?
reshape_3/Reshape/shapePack reshape_3/strided_slice:output:0"reshape_3/Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
reshape_3/Reshape/shape?
reshape_3/ReshapeReshape0embedding_3/embedding_lookup/Identity_1:output:0 reshape_3/Reshape/shape:output:0*
T0*'
_output_shapes
:?????????22
reshape_3/Reshapex
concatenate_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate_1/concat/axis?
concatenate_1/concatConcatV2reshape_2/Reshape:output:0reshape_3/Reshape:output:0"concatenate_1/concat/axis:output:0*
N*
T0*'
_output_shapes
:?????????d2
concatenate_1/concatw
dropout_2/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *????2
dropout_2/dropout/Const?
dropout_2/dropout/MulMulconcatenate_1/concat:output:0 dropout_2/dropout/Const:output:0*
T0*'
_output_shapes
:?????????d2
dropout_2/dropout/Mul
dropout_2/dropout/ShapeShapeconcatenate_1/concat:output:0*
T0*
_output_shapes
:2
dropout_2/dropout/Shape?
.dropout_2/dropout/random_uniform/RandomUniformRandomUniform dropout_2/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????d*
dtype020
.dropout_2/dropout/random_uniform/RandomUniform?
 dropout_2/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *??L=2"
 dropout_2/dropout/GreaterEqual/y?
dropout_2/dropout/GreaterEqualGreaterEqual7dropout_2/dropout/random_uniform/RandomUniform:output:0)dropout_2/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????d2 
dropout_2/dropout/GreaterEqual?
dropout_2/dropout/CastCast"dropout_2/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????d2
dropout_2/dropout/Cast?
dropout_2/dropout/Mul_1Muldropout_2/dropout/Mul:z:0dropout_2/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????d2
dropout_2/dropout/Mul_1?
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes

:d
*
dtype02
dense_2/MatMul/ReadVariableOp?
dense_2/MatMulMatMuldropout_2/dropout/Mul_1:z:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
2
dense_2/MatMul?
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype02 
dense_2/BiasAdd/ReadVariableOp?
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
2
dense_2/BiasAddz
activation_2/ReluReludense_2/BiasAdd:output:0*
T0*'
_output_shapes
:?????????
2
activation_2/Reluw
dropout_3/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout_3/dropout/Const?
dropout_3/dropout/MulMulactivation_2/Relu:activations:0 dropout_3/dropout/Const:output:0*
T0*'
_output_shapes
:?????????
2
dropout_3/dropout/Mul?
dropout_3/dropout/ShapeShapeactivation_2/Relu:activations:0*
T0*
_output_shapes
:2
dropout_3/dropout/Shape?
.dropout_3/dropout/random_uniform/RandomUniformRandomUniform dropout_3/dropout/Shape:output:0*
T0*'
_output_shapes
:?????????
*
dtype020
.dropout_3/dropout/random_uniform/RandomUniform?
 dropout_3/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2"
 dropout_3/dropout/GreaterEqual/y?
dropout_3/dropout/GreaterEqualGreaterEqual7dropout_3/dropout/random_uniform/RandomUniform:output:0)dropout_3/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????
2 
dropout_3/dropout/GreaterEqual?
dropout_3/dropout/CastCast"dropout_3/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????
2
dropout_3/dropout/Cast?
dropout_3/dropout/Mul_1Muldropout_3/dropout/Mul:z:0dropout_3/dropout/Cast:y:0*
T0*'
_output_shapes
:?????????
2
dropout_3/dropout/Mul_1?
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes

:
*
dtype02
dense_3/MatMul/ReadVariableOp?
dense_3/MatMulMatMuldropout_3/dropout/Mul_1:z:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
dense_3/MatMul?
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02 
dense_3/BiasAdd/ReadVariableOp?
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????2
dense_3/BiasAdd?
activation_3/SigmoidSigmoiddense_3/BiasAdd:output:0*
T0*'
_output_shapes
:?????????2
activation_3/Sigmoide
lambda_1/mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *  ?@2
lambda_1/mul/y?
lambda_1/mulMulactivation_3/Sigmoid:y:0lambda_1/mul/y:output:0*
T0*'
_output_shapes
:?????????2
lambda_1/mule
lambda_1/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
lambda_1/add/y?
lambda_1/addAddV2lambda_1/mul:z:0lambda_1/add/y:output:0*
T0*'
_output_shapes
:?????????2
lambda_1/add?
8embedding_2/embeddings/Regularizer/Square/ReadVariableOpReadVariableOp"embedding_2_embedding_lookup_37440*
_output_shapes
:	?2*
dtype02:
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_2/embeddings/Regularizer/SquareSquare@embedding_2/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?22+
)embedding_2/embeddings/Regularizer/Square?
(embedding_2/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_2/embeddings/Regularizer/Const?
&embedding_2/embeddings/Regularizer/SumSum-embedding_2/embeddings/Regularizer/Square:y:01embedding_2/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/Sum?
(embedding_2/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_2/embeddings/Regularizer/mul/x?
&embedding_2/embeddings/Regularizer/mulMul1embedding_2/embeddings/Regularizer/mul/x:output:0/embedding_2/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/mul?
8embedding_3/embeddings/Regularizer/Square/ReadVariableOpReadVariableOp"embedding_3_embedding_lookup_37434*
_output_shapes
:	?K2*
dtype02:
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_3/embeddings/Regularizer/SquareSquare@embedding_3/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?K22+
)embedding_3/embeddings/Regularizer/Square?
(embedding_3/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_3/embeddings/Regularizer/Const?
&embedding_3/embeddings/Regularizer/SumSum-embedding_3/embeddings/Regularizer/Square:y:01embedding_3/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/Sum?
(embedding_3/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_3/embeddings/Regularizer/mul/x?
&embedding_3/embeddings/Regularizer/mulMul1embedding_3/embeddings/Regularizer/mul/x:output:0/embedding_3/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/mul?
IdentityIdentitylambda_1/add:z:0^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp^embedding_2/embedding_lookup9^embedding_2/embeddings/Regularizer/Square/ReadVariableOp^embedding_3/embedding_lookup9^embedding_3/embeddings/Regularizer/Square/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2<
embedding_2/embedding_lookupembedding_2/embedding_lookup2t
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp8embedding_2/embeddings/Regularizer/Square/ReadVariableOp2<
embedding_3/embedding_lookupembedding_3/embedding_lookup2t
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp8embedding_3/embeddings/Regularizer/Square/ReadVariableOp:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/1
?
E
)__inference_reshape_2_layer_call_fn_37688

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_2_layer_call_and_return_conditional_losses_370052
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????2:S O
+
_output_shapes
:?????????2
 
_user_specified_nameinputs
?
c
G__inference_activation_3_layer_call_and_return_conditional_losses_37825

inputs
identityW
SigmoidSigmoidinputs*
T0*'
_output_shapes
:?????????2	
Sigmoid_
IdentityIdentitySigmoid:y:0*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
b
)__inference_dropout_2_layer_call_fn_37740

inputs
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_370612
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????d2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????d22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????d
 
_user_specified_nameinputs
?

`
D__inference_reshape_2_layer_call_and_return_conditional_losses_37005

inputs
identityD
ShapeShapeinputs*
T0*
_output_shapes
:2
Shapet
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 2
strided_slice/stackx
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_1x
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:2
strided_slice/stack_2?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask2
strided_sliced
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :22
Reshape/shape/1?
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0*
N*
T0*
_output_shapes
:2
Reshape/shapeo
ReshapeReshapeinputsReshape/shape:output:0*
T0*'
_output_shapes
:?????????22	
Reshaped
IdentityIdentityReshape:output:0*
T0*'
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????2:S O
+
_output_shapes
:?????????2
 
_user_specified_nameinputs
?	
?
B__inference_dense_2_layer_call_and_return_conditional_losses_37089

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:d
*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
2
MatMul?
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype02
BiasAdd/ReadVariableOp?
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????
2	
BiasAdd?
IdentityIdentityBiasAdd:output:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:?????????
2

Identity"
identityIdentity:output:0*.
_input_shapes
:?????????d::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
E
)__inference_reshape_3_layer_call_fn_37705

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_3_layer_call_and_return_conditional_losses_370252
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????2:S O
+
_output_shapes
:?????????2
 
_user_specified_nameinputs
?
q
+__inference_embedding_2_layer_call_fn_37642

inputs
unknown
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_embedding_2_layer_call_and_return_conditional_losses_369812
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*+
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????:22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs
?
b
D__inference_dropout_2_layer_call_and_return_conditional_losses_37735

inputs

identity_1Z
IdentityIdentityinputs*
T0*'
_output_shapes
:?????????d2

Identityi

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:?????????d2

Identity_1"!

identity_1Identity_1:output:0*&
_input_shapes
:?????????d:O K
'
_output_shapes
:?????????d
 
_user_specified_nameinputs
?
?
'__inference_model_1_layer_call_fn_37595
inputs_0
inputs_1
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_model_1_layer_call_and_return_conditional_losses_373152
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/1
?
?
#__inference_signature_wrapper_37429
input_3
input_4
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinput_3input_4unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8? *)
f$R"
 __inference__wrapped_model_369322
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::22
StatefulPartitionedCallStatefulPartitionedCall:P L
'
_output_shapes
:?????????
!
_user_specified_name	input_3:PL
'
_output_shapes
:?????????
!
_user_specified_name	input_4
?
c
D__inference_dropout_3_layer_call_and_return_conditional_losses_37130

inputs
identity?c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/Consts
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:?????????
2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:?????????
*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
dropout/GreaterEqual/y?
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:?????????
2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:?????????
2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:?????????
2
dropout/Mul_1e
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:?????????
2

Identity"
identityIdentity:output:0*&
_input_shapes
:?????????
:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?
?
__inference_loss_fn_0_37867E
Aembedding_2_embeddings_regularizer_square_readvariableop_resource
identity??8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?
8embedding_2/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpAembedding_2_embeddings_regularizer_square_readvariableop_resource*
_output_shapes
:	?2*
dtype02:
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_2/embeddings/Regularizer/SquareSquare@embedding_2/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?22+
)embedding_2/embeddings/Regularizer/Square?
(embedding_2/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_2/embeddings/Regularizer/Const?
&embedding_2/embeddings/Regularizer/SumSum-embedding_2/embeddings/Regularizer/Square:y:01embedding_2/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/Sum?
(embedding_2/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_2/embeddings/Regularizer/mul/x?
&embedding_2/embeddings/Regularizer/mulMul1embedding_2/embeddings/Regularizer/mul/x:output:0/embedding_2/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/mul?
IdentityIdentity*embedding_2/embeddings/Regularizer/mul:z:09^embedding_2/embeddings/Regularizer/Square/ReadVariableOp*
T0*
_output_shapes
: 2

Identity"
identityIdentity:output:0*
_input_shapes
:2t
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp8embedding_2/embeddings/Regularizer/Square/ReadVariableOp
?
?
'__inference_model_1_layer_call_fn_37613
inputs_0
inputs_1
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_model_1_layer_call_and_return_conditional_losses_373742
StatefulPartitionedCall?
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:?????????
"
_user_specified_name
inputs/1
?
b
D__inference_dropout_3_layer_call_and_return_conditional_losses_37135

inputs

identity_1Z
IdentityIdentityinputs*
T0*'
_output_shapes
:?????????
2

Identityi

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:?????????
2

Identity_1"!

identity_1Identity_1:output:0*&
_input_shapes
:?????????
:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?G
?
B__inference_model_1_layer_call_and_return_conditional_losses_37229
input_3
input_4
embedding_3_36962
embedding_2_36990
dense_2_37100
dense_2_37102
dense_3_37169
dense_3_37171
identity??dense_2/StatefulPartitionedCall?dense_3/StatefulPartitionedCall?!dropout_2/StatefulPartitionedCall?!dropout_3/StatefulPartitionedCall?#embedding_2/StatefulPartitionedCall?8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?#embedding_3/StatefulPartitionedCall?8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
#embedding_3/StatefulPartitionedCallStatefulPartitionedCallinput_4embedding_3_36962*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_embedding_3_layer_call_and_return_conditional_losses_369532%
#embedding_3/StatefulPartitionedCall?
#embedding_2/StatefulPartitionedCallStatefulPartitionedCallinput_3embedding_2_36990*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:?????????2*#
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *O
fJRH
F__inference_embedding_2_layer_call_and_return_conditional_losses_369812%
#embedding_2/StatefulPartitionedCall?
reshape_2/PartitionedCallPartitionedCall,embedding_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_2_layer_call_and_return_conditional_losses_370052
reshape_2/PartitionedCall?
reshape_3/PartitionedCallPartitionedCall,embedding_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????2* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_reshape_3_layer_call_and_return_conditional_losses_370252
reshape_3/PartitionedCall?
concatenate_1/PartitionedCallPartitionedCall"reshape_2/PartitionedCall:output:0"reshape_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *Q
fLRJ
H__inference_concatenate_1_layer_call_and_return_conditional_losses_370402
concatenate_1/PartitionedCall?
!dropout_2/StatefulPartitionedCallStatefulPartitionedCall&concatenate_1/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????d* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_2_layer_call_and_return_conditional_losses_370612#
!dropout_2/StatefulPartitionedCall?
dense_2/StatefulPartitionedCallStatefulPartitionedCall*dropout_2/StatefulPartitionedCall:output:0dense_2_37100dense_2_37102*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_370892!
dense_2/StatefulPartitionedCall?
activation_2/PartitionedCallPartitionedCall(dense_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_activation_2_layer_call_and_return_conditional_losses_371102
activation_2/PartitionedCall?
!dropout_3/StatefulPartitionedCallStatefulPartitionedCall%activation_2/PartitionedCall:output:0"^dropout_2/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????
* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *M
fHRF
D__inference_dropout_3_layer_call_and_return_conditional_losses_371302#
!dropout_3/StatefulPartitionedCall?
dense_3/StatefulPartitionedCallStatefulPartitionedCall*dropout_3/StatefulPartitionedCall:output:0dense_3_37169dense_3_37171*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8? *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_371582!
dense_3/StatefulPartitionedCall?
activation_3/PartitionedCallPartitionedCall(dense_3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *P
fKRI
G__inference_activation_3_layer_call_and_return_conditional_losses_371792
activation_3/PartitionedCall?
lambda_1/PartitionedCallPartitionedCall%activation_3/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8? *L
fGRE
C__inference_lambda_1_layer_call_and_return_conditional_losses_371952
lambda_1/PartitionedCall?
8embedding_2/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_2_36990*
_output_shapes
:	?2*
dtype02:
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_2/embeddings/Regularizer/SquareSquare@embedding_2/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?22+
)embedding_2/embeddings/Regularizer/Square?
(embedding_2/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_2/embeddings/Regularizer/Const?
&embedding_2/embeddings/Regularizer/SumSum-embedding_2/embeddings/Regularizer/Square:y:01embedding_2/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/Sum?
(embedding_2/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_2/embeddings/Regularizer/mul/x?
&embedding_2/embeddings/Regularizer/mulMul1embedding_2/embeddings/Regularizer/mul/x:output:0/embedding_2/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_2/embeddings/Regularizer/mul?
8embedding_3/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_3_36962*
_output_shapes
:	?K2*
dtype02:
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_3/embeddings/Regularizer/SquareSquare@embedding_3/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?K22+
)embedding_3/embeddings/Regularizer/Square?
(embedding_3/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_3/embeddings/Regularizer/Const?
&embedding_3/embeddings/Regularizer/SumSum-embedding_3/embeddings/Regularizer/Square:y:01embedding_3/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/Sum?
(embedding_3/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_3/embeddings/Regularizer/mul/x?
&embedding_3/embeddings/Regularizer/mulMul1embedding_3/embeddings/Regularizer/mul/x:output:0/embedding_3/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/mul?
IdentityIdentity!lambda_1/PartitionedCall:output:0 ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall"^dropout_2/StatefulPartitionedCall"^dropout_3/StatefulPartitionedCall$^embedding_2/StatefulPartitionedCall9^embedding_2/embeddings/Regularizer/Square/ReadVariableOp$^embedding_3/StatefulPartitionedCall9^embedding_3/embeddings/Regularizer/Square/ReadVariableOp*
T0*'
_output_shapes
:?????????2

Identity"
identityIdentity:output:0*Q
_input_shapes@
>:?????????:?????????::::::2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2F
!dropout_2/StatefulPartitionedCall!dropout_2/StatefulPartitionedCall2F
!dropout_3/StatefulPartitionedCall!dropout_3/StatefulPartitionedCall2J
#embedding_2/StatefulPartitionedCall#embedding_2/StatefulPartitionedCall2t
8embedding_2/embeddings/Regularizer/Square/ReadVariableOp8embedding_2/embeddings/Regularizer/Square/ReadVariableOp2J
#embedding_3/StatefulPartitionedCall#embedding_3/StatefulPartitionedCall2t
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp8embedding_3/embeddings/Regularizer/Square/ReadVariableOp:P L
'
_output_shapes
:?????????
!
_user_specified_name	input_3:PL
'
_output_shapes
:?????????
!
_user_specified_name	input_4
?
b
D__inference_dropout_3_layer_call_and_return_conditional_losses_37791

inputs

identity_1Z
IdentityIdentityinputs*
T0*'
_output_shapes
:?????????
2

Identityi

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:?????????
2

Identity_1"!

identity_1Identity_1:output:0*&
_input_shapes
:?????????
:O K
'
_output_shapes
:?????????

 
_user_specified_nameinputs
?
?
F__inference_embedding_3_layer_call_and_return_conditional_losses_36953

inputs
embedding_lookup_36941
identity??8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?embedding_lookup]
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:?????????2
Cast?
embedding_lookupResourceGatherembedding_lookup_36941Cast:y:0",/job:localhost/replica:0/task:0/device:CPU:0*
Tindices0*)
_class
loc:@embedding_lookup/36941*+
_output_shapes
:?????????2*
dtype02
embedding_lookup?
embedding_lookup/IdentityIdentityembedding_lookup:output:0",/job:localhost/replica:0/task:0/device:CPU:0*
T0*)
_class
loc:@embedding_lookup/36941*+
_output_shapes
:?????????22
embedding_lookup/Identity?
embedding_lookup/Identity_1Identity"embedding_lookup/Identity:output:0*
T0*+
_output_shapes
:?????????22
embedding_lookup/Identity_1?
8embedding_3/embeddings/Regularizer/Square/ReadVariableOpReadVariableOpembedding_lookup_36941*
_output_shapes
:	?K2*
dtype02:
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp?
)embedding_3/embeddings/Regularizer/SquareSquare@embedding_3/embeddings/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?K22+
)embedding_3/embeddings/Regularizer/Square?
(embedding_3/embeddings/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2*
(embedding_3/embeddings/Regularizer/Const?
&embedding_3/embeddings/Regularizer/SumSum-embedding_3/embeddings/Regularizer/Square:y:01embedding_3/embeddings/Regularizer/Const:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/Sum?
(embedding_3/embeddings/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *?7?52*
(embedding_3/embeddings/Regularizer/mul/x?
&embedding_3/embeddings/Regularizer/mulMul1embedding_3/embeddings/Regularizer/mul/x:output:0/embedding_3/embeddings/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2(
&embedding_3/embeddings/Regularizer/mul?
IdentityIdentity$embedding_lookup/Identity_1:output:09^embedding_3/embeddings/Regularizer/Square/ReadVariableOp^embedding_lookup*
T0*+
_output_shapes
:?????????22

Identity"
identityIdentity:output:0**
_input_shapes
:?????????:2t
8embedding_3/embeddings/Regularizer/Square/ReadVariableOp8embedding_3/embeddings/Regularizer/Square/ReadVariableOp2$
embedding_lookupembedding_lookup:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs"?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
;
input_30
serving_default_input_3:0?????????
;
input_40
serving_default_input_4:0?????????<
lambda_10
StatefulPartitionedCall:0?????????tensorflow/serving/predict:??
?W
layer-0
layer-1
layer_with_weights-0
layer-2
layer_with_weights-1
layer-3
layer-4
layer-5
layer-6
layer-7
	layer_with_weights-2
	layer-8

layer-9
layer-10
layer_with_weights-3
layer-11
layer-12
layer-13
	optimizer
	variables
trainable_variables
regularization_losses
	keras_api

signatures
?__call__
+?&call_and_return_all_conditional_losses
?_default_save_signature"?S
_tf_keras_network?S{"class_name": "Functional", "name": "model_1", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "config": {"name": "model_1", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_3"}, "name": "input_3", "inbound_nodes": []}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_4"}, "name": "input_4", "inbound_nodes": []}, {"class_name": "Embedding", "config": {"name": "embedding_2", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 610, "output_dim": 50, "embeddings_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "embeddings_regularizer": {"class_name": "L2", "config": {"l2": 9.999999974752427e-07}}, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "name": "embedding_2", "inbound_nodes": [[["input_3", 0, 0, {}]]]}, {"class_name": "Embedding", "config": {"name": "embedding_3", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 9724, "output_dim": 50, "embeddings_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "embeddings_regularizer": {"class_name": "L2", "config": {"l2": 9.999999974752427e-07}}, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "name": "embedding_3", "inbound_nodes": [[["input_4", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_2", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [50]}}, "name": "reshape_2", "inbound_nodes": [[["embedding_2", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_3", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [50]}}, "name": "reshape_3", "inbound_nodes": [[["embedding_3", 0, 0, {}]]]}, {"class_name": "Concatenate", "config": {"name": "concatenate_1", "trainable": true, "dtype": "float32", "axis": -1}, "name": "concatenate_1", "inbound_nodes": [[["reshape_2", 0, 0, {}], ["reshape_3", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_2", "trainable": true, "dtype": "float32", "rate": 0.05, "noise_shape": null, "seed": null}, "name": "dropout_2", "inbound_nodes": [[["concatenate_1", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_2", "trainable": true, "dtype": "float32", "units": 10, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_2", "inbound_nodes": [[["dropout_2", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_2", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_2", "inbound_nodes": [[["dense_2", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_3", "trainable": true, "dtype": "float32", "rate": 0.5, "noise_shape": null, "seed": null}, "name": "dropout_3", "inbound_nodes": [[["activation_2", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_3", "trainable": true, "dtype": "float32", "units": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_3", "inbound_nodes": [[["dropout_3", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_3", "trainable": true, "dtype": "float32", "activation": "sigmoid"}, "name": "activation_3", "inbound_nodes": [[["dense_3", 0, 0, {}]]]}, {"class_name": "Lambda", "config": {"name": "lambda_1", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAQAAAAMAAAATAAAAcxAAAAB8AIgAiAEYABQAiAEXAFMAKQFOqQApAdoBeCkC2gpt\nYXhfcmF0aW5n2gptaW5fcmF0aW5ncgEAAAD6HzxpcHl0aG9uLWlucHV0LTQwLTJmODM5Y2U3ZGUy\nND7aCDxsYW1iZGE+HQAAAPMAAAAA\n", null, {"class_name": "__tuple__", "items": [5.0, 0.5]}]}, "function_type": "lambda", "module": "__main__", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}, "name": "lambda_1", "inbound_nodes": [[["activation_3", 0, 0, {}]]]}], "input_layers": [["input_3", 0, 0], ["input_4", 0, 0]], "output_layers": [["lambda_1", 0, 0]]}, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 1]}, "ndim": 2, "max_ndim": null, "min_ndim": null, "axes": {}}}, {"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 1]}, "ndim": 2, "max_ndim": null, "min_ndim": null, "axes": {}}}], "build_input_shape": [{"class_name": "TensorShape", "items": [null, 1]}, {"class_name": "TensorShape", "items": [null, 1]}], "is_graph_network": true, "keras_version": "2.4.0", "backend": "tensorflow", "model_config": {"class_name": "Functional", "config": {"name": "model_1", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_3"}, "name": "input_3", "inbound_nodes": []}, {"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_4"}, "name": "input_4", "inbound_nodes": []}, {"class_name": "Embedding", "config": {"name": "embedding_2", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 610, "output_dim": 50, "embeddings_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "embeddings_regularizer": {"class_name": "L2", "config": {"l2": 9.999999974752427e-07}}, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "name": "embedding_2", "inbound_nodes": [[["input_3", 0, 0, {}]]]}, {"class_name": "Embedding", "config": {"name": "embedding_3", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 9724, "output_dim": 50, "embeddings_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "embeddings_regularizer": {"class_name": "L2", "config": {"l2": 9.999999974752427e-07}}, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "name": "embedding_3", "inbound_nodes": [[["input_4", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_2", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [50]}}, "name": "reshape_2", "inbound_nodes": [[["embedding_2", 0, 0, {}]]]}, {"class_name": "Reshape", "config": {"name": "reshape_3", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [50]}}, "name": "reshape_3", "inbound_nodes": [[["embedding_3", 0, 0, {}]]]}, {"class_name": "Concatenate", "config": {"name": "concatenate_1", "trainable": true, "dtype": "float32", "axis": -1}, "name": "concatenate_1", "inbound_nodes": [[["reshape_2", 0, 0, {}], ["reshape_3", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_2", "trainable": true, "dtype": "float32", "rate": 0.05, "noise_shape": null, "seed": null}, "name": "dropout_2", "inbound_nodes": [[["concatenate_1", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_2", "trainable": true, "dtype": "float32", "units": 10, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_2", "inbound_nodes": [[["dropout_2", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_2", "trainable": true, "dtype": "float32", "activation": "relu"}, "name": "activation_2", "inbound_nodes": [[["dense_2", 0, 0, {}]]]}, {"class_name": "Dropout", "config": {"name": "dropout_3", "trainable": true, "dtype": "float32", "rate": 0.5, "noise_shape": null, "seed": null}, "name": "dropout_3", "inbound_nodes": [[["activation_2", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "dense_3", "trainable": true, "dtype": "float32", "units": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "dense_3", "inbound_nodes": [[["dropout_3", 0, 0, {}]]]}, {"class_name": "Activation", "config": {"name": "activation_3", "trainable": true, "dtype": "float32", "activation": "sigmoid"}, "name": "activation_3", "inbound_nodes": [[["dense_3", 0, 0, {}]]]}, {"class_name": "Lambda", "config": {"name": "lambda_1", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAQAAAAMAAAATAAAAcxAAAAB8AIgAiAEYABQAiAEXAFMAKQFOqQApAdoBeCkC2gpt\nYXhfcmF0aW5n2gptaW5fcmF0aW5ncgEAAAD6HzxpcHl0aG9uLWlucHV0LTQwLTJmODM5Y2U3ZGUy\nND7aCDxsYW1iZGE+HQAAAPMAAAAA\n", null, {"class_name": "__tuple__", "items": [5.0, 0.5]}]}, "function_type": "lambda", "module": "__main__", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}, "name": "lambda_1", "inbound_nodes": [[["activation_3", 0, 0, {}]]]}], "input_layers": [["input_3", 0, 0], ["input_4", 0, 0]], "output_layers": [["lambda_1", 0, 0]]}}, "training_config": {"loss": "mean_squared_error", "metrics": null, "weighted_metrics": null, "loss_weights": null, "optimizer_config": {"class_name": "Adam", "config": {"name": "Adam", "learning_rate": 0.0010000000474974513, "decay": 0.0, "beta_1": 0.8999999761581421, "beta_2": 0.9990000128746033, "epsilon": 1e-07, "amsgrad": false}}}}
?"?
_tf_keras_input_layer?{"class_name": "InputLayer", "name": "input_3", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_3"}}
?"?
_tf_keras_input_layer?{"class_name": "InputLayer", "name": "input_4", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_4"}}
?

embeddings
	variables
trainable_variables
regularization_losses
	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Embedding", "name": "embedding_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "stateful": false, "must_restore_from_config": false, "config": {"name": "embedding_2", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 610, "output_dim": 50, "embeddings_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "embeddings_regularizer": {"class_name": "L2", "config": {"l2": 9.999999974752427e-07}}, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 1]}}
?

embeddings
	variables
trainable_variables
regularization_losses
	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Embedding", "name": "embedding_3", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "stateful": false, "must_restore_from_config": false, "config": {"name": "embedding_3", "trainable": true, "batch_input_shape": {"class_name": "__tuple__", "items": [null, null]}, "dtype": "float32", "input_dim": 9724, "output_dim": 50, "embeddings_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "embeddings_regularizer": {"class_name": "L2", "config": {"l2": 9.999999974752427e-07}}, "activity_regularizer": null, "embeddings_constraint": null, "mask_zero": false, "input_length": null}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 1]}}
?
	variables
 trainable_variables
!regularization_losses
"	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Reshape", "name": "reshape_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "reshape_2", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [50]}}}
?
#	variables
$trainable_variables
%regularization_losses
&	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Reshape", "name": "reshape_3", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "reshape_3", "trainable": true, "dtype": "float32", "target_shape": {"class_name": "__tuple__", "items": [50]}}}
?
'	variables
(trainable_variables
)regularization_losses
*	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Concatenate", "name": "concatenate_1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "concatenate_1", "trainable": true, "dtype": "float32", "axis": -1}, "build_input_shape": [{"class_name": "TensorShape", "items": [null, 50]}, {"class_name": "TensorShape", "items": [null, 50]}]}
?
+	variables
,trainable_variables
-regularization_losses
.	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Dropout", "name": "dropout_2", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_2", "trainable": true, "dtype": "float32", "rate": 0.05, "noise_shape": null, "seed": null}}
?

/kernel
0bias
1	variables
2trainable_variables
3regularization_losses
4	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Dense", "name": "dense_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense_2", "trainable": true, "dtype": "float32", "units": 10, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 100}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 100]}}
?
5	variables
6trainable_variables
7regularization_losses
8	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Activation", "name": "activation_2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "activation_2", "trainable": true, "dtype": "float32", "activation": "relu"}}
?
9	variables
:trainable_variables
;regularization_losses
<	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Dropout", "name": "dropout_3", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dropout_3", "trainable": true, "dtype": "float32", "rate": 0.5, "noise_shape": null, "seed": null}}
?

=kernel
>bias
?	variables
@trainable_variables
Aregularization_losses
B	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Dense", "name": "dense_3", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "dense_3", "trainable": true, "dtype": "float32", "units": 1, "activation": "linear", "use_bias": true, "kernel_initializer": {"class_name": "HeNormal", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 10}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 10]}}
?
C	variables
Dtrainable_variables
Eregularization_losses
F	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Activation", "name": "activation_3", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "activation_3", "trainable": true, "dtype": "float32", "activation": "sigmoid"}}
?
G	variables
Htrainable_variables
Iregularization_losses
J	keras_api
?__call__
+?&call_and_return_all_conditional_losses"?
_tf_keras_layer?{"class_name": "Lambda", "name": "lambda_1", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "lambda_1", "trainable": true, "dtype": "float32", "function": {"class_name": "__tuple__", "items": ["4wEAAAAAAAAAAQAAAAMAAAATAAAAcxAAAAB8AIgAiAEYABQAiAEXAFMAKQFOqQApAdoBeCkC2gpt\nYXhfcmF0aW5n2gptaW5fcmF0aW5ncgEAAAD6HzxpcHl0aG9uLWlucHV0LTQwLTJmODM5Y2U3ZGUy\nND7aCDxsYW1iZGE+HQAAAPMAAAAA\n", null, {"class_name": "__tuple__", "items": [5.0, 0.5]}]}, "function_type": "lambda", "module": "__main__", "output_shape": null, "output_shape_type": "raw", "output_shape_module": null, "arguments": {}}}
?
Kiter

Lbeta_1

Mbeta_2
	Ndecay
Olearning_ratem?m?/m?0m?=m?>m?v?v?/v?0v?=v?>v?"
	optimizer
J
0
1
/2
03
=4
>5"
trackable_list_wrapper
J
0
1
/2
03
=4
>5"
trackable_list_wrapper
0
?0
?1"
trackable_list_wrapper
?
Pmetrics
Qnon_trainable_variables
	variables
trainable_variables

Rlayers
Slayer_metrics
Tlayer_regularization_losses
regularization_losses
?__call__
?_default_save_signature
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
-
?serving_default"
signature_map
):'	?22embedding_2/embeddings
'
0"
trackable_list_wrapper
'
0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
?
Umetrics
Vnon_trainable_variables
	variables
trainable_variables

Wlayers
Xlayer_metrics
Ylayer_regularization_losses
regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
):'	?K22embedding_3/embeddings
'
0"
trackable_list_wrapper
'
0"
trackable_list_wrapper
(
?0"
trackable_list_wrapper
?
Zmetrics
[non_trainable_variables
	variables
trainable_variables

\layers
]layer_metrics
^layer_regularization_losses
regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
_metrics
`non_trainable_variables
	variables
 trainable_variables

alayers
blayer_metrics
clayer_regularization_losses
!regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
dmetrics
enon_trainable_variables
#	variables
$trainable_variables

flayers
glayer_metrics
hlayer_regularization_losses
%regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
imetrics
jnon_trainable_variables
'	variables
(trainable_variables

klayers
llayer_metrics
mlayer_regularization_losses
)regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
nmetrics
onon_trainable_variables
+	variables
,trainable_variables

players
qlayer_metrics
rlayer_regularization_losses
-regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 :d
2dense_2/kernel
:
2dense_2/bias
.
/0
01"
trackable_list_wrapper
.
/0
01"
trackable_list_wrapper
 "
trackable_list_wrapper
?
smetrics
tnon_trainable_variables
1	variables
2trainable_variables

ulayers
vlayer_metrics
wlayer_regularization_losses
3regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
xmetrics
ynon_trainable_variables
5	variables
6trainable_variables

zlayers
{layer_metrics
|layer_regularization_losses
7regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
}metrics
~non_trainable_variables
9	variables
:trainable_variables

layers
?layer_metrics
 ?layer_regularization_losses
;regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 :
2dense_3/kernel
:2dense_3/bias
.
=0
>1"
trackable_list_wrapper
.
=0
>1"
trackable_list_wrapper
 "
trackable_list_wrapper
?
?metrics
?non_trainable_variables
?	variables
@trainable_variables
?layers
?layer_metrics
 ?layer_regularization_losses
Aregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?metrics
?non_trainable_variables
C	variables
Dtrainable_variables
?layers
?layer_metrics
 ?layer_regularization_losses
Eregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
?metrics
?non_trainable_variables
G	variables
Htrainable_variables
?layers
?layer_metrics
 ?layer_regularization_losses
Iregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
?
0
1
2
3
4
5
6
7
	8

9
10
11
12
13"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
(
?0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
?

?total

?count
?	variables
?	keras_api"?
_tf_keras_metricj{"class_name": "Mean", "name": "loss", "dtype": "float32", "config": {"name": "loss", "dtype": "float32"}}
:  (2total
:  (2count
0
?0
?1"
trackable_list_wrapper
.
?	variables"
_generic_user_object
.:,	?22Adam/embedding_2/embeddings/m
.:,	?K22Adam/embedding_3/embeddings/m
%:#d
2Adam/dense_2/kernel/m
:
2Adam/dense_2/bias/m
%:#
2Adam/dense_3/kernel/m
:2Adam/dense_3/bias/m
.:,	?22Adam/embedding_2/embeddings/v
.:,	?K22Adam/embedding_3/embeddings/v
%:#d
2Adam/dense_2/kernel/v
:
2Adam/dense_2/bias/v
%:#
2Adam/dense_3/kernel/v
:2Adam/dense_3/bias/v
?2?
'__inference_model_1_layer_call_fn_37595
'__inference_model_1_layer_call_fn_37389
'__inference_model_1_layer_call_fn_37330
'__inference_model_1_layer_call_fn_37613?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
B__inference_model_1_layer_call_and_return_conditional_losses_37577
B__inference_model_1_layer_call_and_return_conditional_losses_37229
B__inference_model_1_layer_call_and_return_conditional_losses_37510
B__inference_model_1_layer_call_and_return_conditional_losses_37270?
???
FullArgSpec1
args)?&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults?
p 

 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
 __inference__wrapped_model_36932?
???
FullArgSpec
args? 
varargsjargs
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *N?K
I?F
!?
input_3?????????
!?
input_4?????????
?2?
+__inference_embedding_2_layer_call_fn_37642?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
F__inference_embedding_2_layer_call_and_return_conditional_losses_37635?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
+__inference_embedding_3_layer_call_fn_37671?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
F__inference_embedding_3_layer_call_and_return_conditional_losses_37664?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_reshape_2_layer_call_fn_37688?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_reshape_2_layer_call_and_return_conditional_losses_37683?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_reshape_3_layer_call_fn_37705?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
D__inference_reshape_3_layer_call_and_return_conditional_losses_37700?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
-__inference_concatenate_1_layer_call_fn_37718?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
H__inference_concatenate_1_layer_call_and_return_conditional_losses_37712?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_dropout_2_layer_call_fn_37745
)__inference_dropout_2_layer_call_fn_37740?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
D__inference_dropout_2_layer_call_and_return_conditional_losses_37730
D__inference_dropout_2_layer_call_and_return_conditional_losses_37735?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
'__inference_dense_2_layer_call_fn_37764?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
B__inference_dense_2_layer_call_and_return_conditional_losses_37755?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
,__inference_activation_2_layer_call_fn_37774?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
G__inference_activation_2_layer_call_and_return_conditional_losses_37769?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
)__inference_dropout_3_layer_call_fn_37801
)__inference_dropout_3_layer_call_fn_37796?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
D__inference_dropout_3_layer_call_and_return_conditional_losses_37786
D__inference_dropout_3_layer_call_and_return_conditional_losses_37791?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
'__inference_dense_3_layer_call_fn_37820?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
B__inference_dense_3_layer_call_and_return_conditional_losses_37811?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
,__inference_activation_3_layer_call_fn_37830?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
G__inference_activation_3_layer_call_and_return_conditional_losses_37825?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_lambda_1_layer_call_fn_37856
(__inference_lambda_1_layer_call_fn_37851?
???
FullArgSpec1
args)?&
jself
jinputs
jmask

jtraining
varargs
 
varkw
 
defaults?

 
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
C__inference_lambda_1_layer_call_and_return_conditional_losses_37846
C__inference_lambda_1_layer_call_and_return_conditional_losses_37838?
???
FullArgSpec1
args)?&
jself
jinputs
jmask

jtraining
varargs
 
varkw
 
defaults?

 
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
__inference_loss_fn_0_37867?
???
FullArgSpec
args? 
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *? 
?2?
__inference_loss_fn_1_37878?
???
FullArgSpec
args? 
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *? 
?B?
#__inference_signature_wrapper_37429input_3input_4"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 ?
 __inference__wrapped_model_36932?/0=>X?U
N?K
I?F
!?
input_3?????????
!?
input_4?????????
? "3?0
.
lambda_1"?
lambda_1??????????
G__inference_activation_2_layer_call_and_return_conditional_losses_37769X/?,
%?"
 ?
inputs?????????

? "%?"
?
0?????????

? {
,__inference_activation_2_layer_call_fn_37774K/?,
%?"
 ?
inputs?????????

? "??????????
?
G__inference_activation_3_layer_call_and_return_conditional_losses_37825X/?,
%?"
 ?
inputs?????????
? "%?"
?
0?????????
? {
,__inference_activation_3_layer_call_fn_37830K/?,
%?"
 ?
inputs?????????
? "???????????
H__inference_concatenate_1_layer_call_and_return_conditional_losses_37712?Z?W
P?M
K?H
"?
inputs/0?????????2
"?
inputs/1?????????2
? "%?"
?
0?????????d
? ?
-__inference_concatenate_1_layer_call_fn_37718vZ?W
P?M
K?H
"?
inputs/0?????????2
"?
inputs/1?????????2
? "??????????d?
B__inference_dense_2_layer_call_and_return_conditional_losses_37755\/0/?,
%?"
 ?
inputs?????????d
? "%?"
?
0?????????

? z
'__inference_dense_2_layer_call_fn_37764O/0/?,
%?"
 ?
inputs?????????d
? "??????????
?
B__inference_dense_3_layer_call_and_return_conditional_losses_37811\=>/?,
%?"
 ?
inputs?????????

? "%?"
?
0?????????
? z
'__inference_dense_3_layer_call_fn_37820O=>/?,
%?"
 ?
inputs?????????

? "???????????
D__inference_dropout_2_layer_call_and_return_conditional_losses_37730\3?0
)?&
 ?
inputs?????????d
p
? "%?"
?
0?????????d
? ?
D__inference_dropout_2_layer_call_and_return_conditional_losses_37735\3?0
)?&
 ?
inputs?????????d
p 
? "%?"
?
0?????????d
? |
)__inference_dropout_2_layer_call_fn_37740O3?0
)?&
 ?
inputs?????????d
p
? "??????????d|
)__inference_dropout_2_layer_call_fn_37745O3?0
)?&
 ?
inputs?????????d
p 
? "??????????d?
D__inference_dropout_3_layer_call_and_return_conditional_losses_37786\3?0
)?&
 ?
inputs?????????

p
? "%?"
?
0?????????

? ?
D__inference_dropout_3_layer_call_and_return_conditional_losses_37791\3?0
)?&
 ?
inputs?????????

p 
? "%?"
?
0?????????

? |
)__inference_dropout_3_layer_call_fn_37796O3?0
)?&
 ?
inputs?????????

p
? "??????????
|
)__inference_dropout_3_layer_call_fn_37801O3?0
)?&
 ?
inputs?????????

p 
? "??????????
?
F__inference_embedding_2_layer_call_and_return_conditional_losses_37635_/?,
%?"
 ?
inputs?????????
? ")?&
?
0?????????2
? ?
+__inference_embedding_2_layer_call_fn_37642R/?,
%?"
 ?
inputs?????????
? "??????????2?
F__inference_embedding_3_layer_call_and_return_conditional_losses_37664_/?,
%?"
 ?
inputs?????????
? ")?&
?
0?????????2
? ?
+__inference_embedding_3_layer_call_fn_37671R/?,
%?"
 ?
inputs?????????
? "??????????2?
C__inference_lambda_1_layer_call_and_return_conditional_losses_37838`7?4
-?*
 ?
inputs?????????

 
p
? "%?"
?
0?????????
? ?
C__inference_lambda_1_layer_call_and_return_conditional_losses_37846`7?4
-?*
 ?
inputs?????????

 
p 
? "%?"
?
0?????????
? 
(__inference_lambda_1_layer_call_fn_37851S7?4
-?*
 ?
inputs?????????

 
p
? "??????????
(__inference_lambda_1_layer_call_fn_37856S7?4
-?*
 ?
inputs?????????

 
p 
? "??????????:
__inference_loss_fn_0_37867?

? 
? "? :
__inference_loss_fn_1_37878?

? 
? "? ?
B__inference_model_1_layer_call_and_return_conditional_losses_37229?/0=>`?]
V?S
I?F
!?
input_3?????????
!?
input_4?????????
p

 
? "%?"
?
0?????????
? ?
B__inference_model_1_layer_call_and_return_conditional_losses_37270?/0=>`?]
V?S
I?F
!?
input_3?????????
!?
input_4?????????
p 

 
? "%?"
?
0?????????
? ?
B__inference_model_1_layer_call_and_return_conditional_losses_37510?/0=>b?_
X?U
K?H
"?
inputs/0?????????
"?
inputs/1?????????
p

 
? "%?"
?
0?????????
? ?
B__inference_model_1_layer_call_and_return_conditional_losses_37577?/0=>b?_
X?U
K?H
"?
inputs/0?????????
"?
inputs/1?????????
p 

 
? "%?"
?
0?????????
? ?
'__inference_model_1_layer_call_fn_37330?/0=>`?]
V?S
I?F
!?
input_3?????????
!?
input_4?????????
p

 
? "???????????
'__inference_model_1_layer_call_fn_37389?/0=>`?]
V?S
I?F
!?
input_3?????????
!?
input_4?????????
p 

 
? "???????????
'__inference_model_1_layer_call_fn_37595?/0=>b?_
X?U
K?H
"?
inputs/0?????????
"?
inputs/1?????????
p

 
? "???????????
'__inference_model_1_layer_call_fn_37613?/0=>b?_
X?U
K?H
"?
inputs/0?????????
"?
inputs/1?????????
p 

 
? "???????????
D__inference_reshape_2_layer_call_and_return_conditional_losses_37683\3?0
)?&
$?!
inputs?????????2
? "%?"
?
0?????????2
? |
)__inference_reshape_2_layer_call_fn_37688O3?0
)?&
$?!
inputs?????????2
? "??????????2?
D__inference_reshape_3_layer_call_and_return_conditional_losses_37700\3?0
)?&
$?!
inputs?????????2
? "%?"
?
0?????????2
? |
)__inference_reshape_3_layer_call_fn_37705O3?0
)?&
$?!
inputs?????????2
? "??????????2?
#__inference_signature_wrapper_37429?/0=>i?f
? 
_?\
,
input_3!?
input_3?????????
,
input_4!?
input_4?????????"3?0
.
lambda_1"?
lambda_1?????????