require "./jni/*"

lib JNI
  union JValue
    z: JBoolean
    b: JByte
    c: JChar
    s: JShort
    i: JInt
    j: JLong
    f: JFloat
    d: JDouble
    l: JObject
  end

  struct JFieldID
  end

  struct JMethodID
  end

  ##
  # Used in REgisterNatives to describe native method name, signature,
  # and function pointer.
  ##

  struct JNINativeMethod
    name: Char
    signature: Char
    fnPtr: Void
  end

  ##
  # JNI Native Method Interface
  ##

  struct JNINativeInterface
  end

  struct JNIEnv
  end

  ##
  # JNI Invocation Interface
  ##

  struct JNIInvokeInterface
  end

  struct JNINativeInterface
    reserved0: Void
    reserved1: Void
    reserved2: Void

    reserved3: Void
  end

  fun get_version = GetVersion(env: JNIEnv): JInt

  fun define_class = DefineClass(env: JNIEnv, name: Char*, loader: JObject, buf: JByte, len: JSize): JClass
  fun find_class = FindClass(env: JNIEnv, name: Char): JClass

  fun from_reflected_method = FromReflectedMethod(env: JNIEnv, method: JObject): JMethodID
  fun from_reflected_field = FromReflectedField(env: JNIEnv, field: JObject): JFieldID

  fun to_reflected_method = ToReflectedMethod(env: JNIEnv, cls: JClass, methodID: JMethodID, isStacic: JBoolean): JObject

  fun get_superclass = GetSuperclass(env: JNIEnv, sub: JClass): JClass
  fun is_assignable_from = IsAssignableFrom(env: JNIEnv, sub: JClass, sup: JClass): JBoolean

  fun to_relfected_field = ToReflectedField(env: JNIEnv, cls: JClass, fieldID: JFieldID, isStatic: JBoolean): JObject

  fun throw = Throw(env: JNIEnv, obj: JThrowable): JInt
  fun throw_new = ThrowNew(env: JNIEnv, clazz: JClass, msg: Char*): JInt
  fun exception_occurred =  ExceptionOccurred(env: JNIEnv): JThrowable
  fun exception_describe = ExceptionDescribe(env: JNIEnv): Void
  fun exception_clear = ExceptionClear(env: JNIEnv): Void
  fun fatal_error = FatalError(env: JNIEnv, msg: Char*): Void

  fun push_local_frame = PushLocalFrame(env: JNIEnv, capacity: JInt): JInt
  fun pop_local_framce = PopLocalFrame(env: JNIEnv, result: JObject): JObject

  fun new_global_ref = NewGlobalRef(env: JNIEnv, lobj: JObject): JObject
  fun delete_global_ref = DeleteGlobalRef(env: JNIEnv, gref: JObject): Void
  fun delete_local_ref = DeleteLocalRef(env: JNIEnv, obj: JObject): Void
  fun is_same_object = IsSameObject(env: JNIEnv, obj: JObject, obj: JObject): JBoolean
  fun new_local_ref = NewLocalRef(env: JNIEnv, ref: JObject): JObject
  fun ensure_local_capacity = EnsureLocalCapacity(env: JNIEnv, capacity: JInt):  JInt

  fun alloc_object = AllocObject(env: JNIEnv, clazz: JClass): JObject
  fun new_object = NewObject(env: JNIEnv, clazz: JClass, methodID: JMethodID, ...): JObject
  fun new_object_a = NewObjectA(env: JNIEnv, clazz: JClass, methodID: JMethodID, args: JValue*): JObject

  fun get_object_class = GetObjectClass(env: JNIEnv, obj: JObject): JClass
  fun is_instance_of = IsInstanceOf(env: JNIEnv, obj: JObject, clazz: JClass): JBoolean

  fun get_method_id = GetMethodID(env: JNIEnv, clazz: JClass, name: Char*, sig: Char*): JMethodID

  fun call_object_method = CallObjectMethod(env: JNIEnv, obj: JObject, methodID: JMethodID, ...): JObject
  fun call_object_method_a = CallObjectMethodA(env: JNIEnv, obj: JObject, methodID: JMethodID, args: JValue*): JObject

  fun call_boolean_method = CallBooleanMethod(env: JNIEnv, obj: JObject, methodID: JMethodID, ...): JBoolean
  fun call_boolean_method_a= CallBooleanMethodA(env: JNIEnv, obj: JObject, methodID: JMethodID, args: JValue*): JBoolean

  fun call_byte_method = CallByteMethod(env: JNIEnv, obj: JObject, methodID: JMethodID, ...): JByte
  fun call_byte_method_a = CallByteMethodA(env: JNIEnv, obj: JObject, methodID: JMethodID, args: JValue*): JByte

  fun call_char_method = CallCharMethod(env: JNIEnv, obj: JObject, methodID: JMethodID, ...): JChar
  fun call_char_method_a = CallCharMethodA(env: JNIEnv, obj: JObject, methodID: JMethodID, args: JValue*): JChar

  fun call_short_method = CallShortMethod(env: JNIEnv, obj: JObject, methodID: JMethodID, ...): JShort
  fun call_short_method_a = CallShortMethodA(env: JNIEnv, obj: JObject, methodID: JMethodID, args: JValue*): JShort

  fun call_int_method = CallIntMethod(env: JNIEnv, obj: JObject, methodID: JMethodID, ...): JInt
  fun call_int_method_a = CallIntMethodA(env: JNIEnv, obj: JObject, methodID: JMethodID, args: JValue*): JInt

  fun call_long_method = CallLongMethod(env: JNIEnv, obj: JObject, methodID: JMethodID, ...): JLong
  fun call_long_method_a = CallLongMethodA(env: JNIEnv, obj: JObject, methodID: JMethodID, args: JValue*): JLong

  fun call_float_method = CallFloatMethod(env: JNIEnv, obj: JObject, methodID: JMethodID, ...): JFloat
  fun call_float_method_a = CallFloatMethodA(env: JNIEnv, obj: JObject, methodID: JMethodID, args: JValue*): JFloat

  fun call_double_method = CallDoubleMethod(env: JNIEnv, obj: JObject, methodID: JMethodID, ...): JDouble
  fun call_double_method_a = CallDoubleMethodA(env: JNIEnv, obj: JObject, methodID: JMethodID, args: JValue*): JDouble

  fun call_void_method = CallVoidMethod(env: JNIEnv, obj: JObject, methodID: JMethodID, ...): Void
  fun call_void_method_a = CallVoidMethodA(env: JNIEnv, obj: JObject, methodID: JMethodID, args: JValue*): Void

  fun call_nonvirtual_object_method = CallNonvirtualObjectMethod(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, ...): JObject
  fun call_nonvirtual_object_method_a = CallNonvirtualObjectMethodA(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, args: JValue*): JObject

  fun call_nonvirtual_boolean_method = CallNonvirtualBooleanMethod(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, ...): JBoolean
  fun call_nonvirtual_boolean_method_a = CallNonvirtualBooleanMethodA(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, args: JValue*): JBoolean

  fun call_nonvirtual_byte_method = CallNonvirtualByteMethod(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, ...): JByte
  fun call_nonvirtual_byte_method_a = CallNonvirtualByteMethodA(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, args: JValue*): JByte

  fun call_nonvirtual_char_method = CallNonvirtualCharMethod(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, ...): JChar
  fun call_nonvirtual_char_method_a = CallNonvirtualCharMethodA(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, args: JValue*): JChar

  fun call_nonvirtual_short_method = CallNonvirtualShortMethod(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, ...): JShort
  fun call_nonvirtual_short_method_a = CallNonvirtualShortMethodA(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, args: JValue*): JShort

  fun call_nonvirtual_int_method= CallNonvirtualIntMethod(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, ...): JInt
  fun call_nonvirtual_int_method_a = CallNonvirtualIntMethodA(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, args: JValue*): JInt

  fun call_nonvirtual_long_method = CallNonvirtualLongMethod(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, ...): JLong
  fun call_nonvirtual_long_method_a = CallNonvirtualLongMethodA(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, args: JValue*): JLong

  fun call_nonvirtual_float_method = CallNonvirtualFloatMethod(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, ...): JFloat
  fun call_nonvirtual_float_method_a = CallNonvirtualFloatMethodA(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, args: JValue*): JFloat

  fun call_nonvirtual_double_method = CallNonvirtualDoubleMethod(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, ...): JDouble
  fun call_nonvirtual_double_method_a = CallNonvirtualDoubleMethodA(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, args: JValue*): JDouble

  fun call_nonvirtual_void_method = CallNonvirtualVoidMethod(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, ...): Void
  fun call_nonvirtual_void_method_a = CallNonvirtualVoidMethodA(env: JNIEnv, obj: JObject, clazz: JClass, methodID: JMethodID, args: JValue*): Void

  fun get_field_id = GetFieldID(env: JNIEnv, clazz: JClass, name: Char*, sig: Char*): JFieldID

  fun get_object_field = GetObjectField(env: JNIEnv, obj: JObject, fieldID: JFieldID): JObject
  fun get_boolean_field = GetBooleanField(env: JNIEnv, obj: JObject, fieldID: JFieldID): JBoolean
  fun get_byte_field = GetByteField(env: JNIEnv, obj: JObject, fieldID: JFieldID): JByte
  fun get_char_field = GetCharField(env: JNIEnv, obj: JObject, fieldID: JFieldID): JChar
  fun get_short_field = GetShortField(env: JNIEnv, obj: JObject, fieldID: JFieldID): JShort
  fun get_int_field = GetIntField(env: JNIEnv, obj: JObject, fieldID: JFieldID): JInt
  fun get_long_field = GetLongField(env: JNIEnv, obj: JObject, fieldID: JFieldID): JLong
  fun get_float_field = GetFloatField(env: JNIEnv, obj: JObject, fieldID: JFieldID): JFloat
  fun get_double_field = GetDoubleField(env: JNIEnv, obj: JObject, fieldID: JFieldID): JDouble

  fun set_object_field = SetObjectField(env: JNIEnv, obj: JObject, fieldID: JFieldID, val: JObject): Void
  fun set_boolean_field = SetBooleanField(env: JNIEnv, obj: JObject, fieldID: JFieldID, val: JBoolean): Void
  fun set_byte_field = SetByteField(env: JNIEnv, obj: JObject, fieldID: JFieldID, val: JByte): Void
  fun set_char_field = SetCharField(env: JNIEnv, obj: JObject, fieldID: JFieldID, val: JChar): Void
  fun set_short_field = SetShortField(env: JNIEnv, obj: JObject, fieldID: JFieldID, val: JShort): Void
  fun set_int_field = SetIntField(env: JNIEnv, obj: JObject, fieldID: JFieldID, val: JInt): Void
  fun set_long_field = SetLongField(env: JNIEnv, obj: JObject, fieldID: JFieldID, val: JLong): Void
  fun set_float_field = SetFloatField(env: JNIEnv, obj: JObject, fieldID: JFieldID, val: JFloat): Void
  fun set_double_field = SetDoubleField(env: JNIEnv, obj: JObject, fieldID: JFieldID, val: JDouble): Void

  fun get_static_method_id = GetStaticMethodID(env: JNIEnv, clazz: JClass, name: Char*, sig: Char*): JMethodID

  fun call_static_object_method = CallStaticObjectMethod(env: JNIEnv, clazz: JClass, methodID: JMethodID, ...): JObject
  fun call_static_object_method_a = CallStaticObjectMethodA(env: JNIEnv, clazz: JClass, methodID: JMethodID, args: JValue*): JObject

  fun call_static_boolean_method = CallStaticBooleanMethod(env: JNIEnv, clazz: JClass, methodID: JMethodID, ...): JBoolean
  fun call_static_boolean_method_a = CallStaticBooleanMethodA(env: JNIEnv, clazz: JClass, methodID: JMethodID, args: JValue*): JBoolean

  fun call_static_byte_method = CallStaticByteMethod(env: JNIEnv, clazz: JClass, methodID: JMethodID, ...): JByte
  fun call_static_byte_method_a = CallStaticByteMethodA(env: JNIEnv, clazz: JClass, methodID: JMethodID, args: JValue*): JByte

  fun call_static_char_method = CallStaticCharMethod(env: JNIEnv, clazz: JClass, methodID: JMethodID, ...): JChar
  fun call_static_char_method_a = CallStaticCharMethodA(env: JNIEnv, clazz: JClass, methodID: JMethodID, args: JValue*): JChar

  fun call_static_short_method = CallStaticShortMethod(env: JNIEnv, clazz: JClass, methodID: JMethodID, ...): JShort
  fun call_static_short_method_a = CallStaticShortMethodA(env: JNIEnv, clazz: JClass, methodID: JMethodID, args: JValue*): JShort

  fun call_static_int_method = CallStaticIntMethod(env: JNIEnv, clazz: JClass, methodID: JMethodID, ...): JInt
  fun call_static_int_method_a = CallStaticIntMethodA(env: JNIEnv, clazz: JClass, methodID: JMethodID, args: JValue*): JInt

  fun call_static_long_method = CallStaticLongMethod(env: JNIEnv, clazz: JClass, methodID: JMethodID, ...): JLong
  fun call_static_long_method_a = CallStaticLongMethodA(env: JNIEnv, clazz: JClass, methodID: JMethodID, args: JValue*): JLong

  fun call_static_float_method = CallStaticFloatMethod(env: JNIEnv, clazz: JClass, methodID: JMethodID, ...): JFloat
  fun call_static_float_method_a = CallStaticFloatMethodA(env: JNIEnv, clazz: JClass, methodID: JMethodID, args: JValue*): JFloat

  fun call_static_double_method = CallStaticDoubleMethod(env: JNIEnv, clazz: JClass, methodID: JMethodID, ...): JDouble
  fun call_static_double_method_a = CallStaticDoubleMethodA(env: JNIEnv, clazz: JClass, methodID: JMethodID, args: JValue*): JDouble

  fun call_static_void_method = CallStaticVoidMethod(env: JNIEnv, cls: JClass, methodID: JMethodID, ...): Void
  fun call_static_void_method_a = CallStaticVoidMethodA(env: JNIEnv, cls: JClass, methodID: JMethodID, args: JValue*): Void

  fun get_static_field_id = GetStaticFieldID(env: JNIEnv, clazz: JClass, name: Char*, sig: Char*): JFieldID
  fun get_static_object_field = GetStaticObjectField(env: JNIEnv, clazz: JClass, fieldID: JFieldID): JObject
  fun get_static_boolean_field = GetStaticBooleanField(env: JNIEnv, clazz: JClass, fieldID: JFieldID): JBoolean
  fun get_static_byte_field = GetStaticByteField(env: JNIEnv, clazz: JClass, fieldID: JFieldID): JByte
  fun get_static_char_field = GetStaticCharField(env: JNIEnv, clazz: JClass, fieldID: JFieldID): JChar
  fun get_static_short_field = GetStaticShortField(env: JNIEnv, clazz: JClass, fieldID: JFieldID): JShort
  fun get_static_int_field = GetStaticIntField(env: JNIEnv, clazz: JClass, fieldID: JFieldID): JInt
  fun get_static_long_field = GetStaticLongField(env: JNIEnv, clazz: JClass, fieldID: JFieldID): JLong
  fun get_static_float_field = GetStaticFloatField(env: JNIEnv, clazz: JClass, fieldID: JFieldID): JFloat
  fun get_static_double_field = GetStaticDoubleField(env: JNIEnv, clazz: JClass, fieldID: JFieldID): JDouble

  fun set_static_object_field = SetStaticObjectField(env: JNIEnv, clazz: JClass, fieldID: JFieldID, val: JObject): Void
  fun set_static_boolean_field = SetStaticBooleanField(env: JNIEnv, clazz: JClass, fieldID: JFieldID, val: JBoolean): Void
  fun set_static_byte_field = SetStaticByteField(env: JNIEnv, clazz: JClass, fieldID: JFieldID, val: JByte): Void
  fun set_static_char_field = SetStaticCharField(env: JNIEnv, clazz: JClass, fieldID: JFieldID, val: JChar): Void
  fun set_static_short_field = SetStaticShortField(env: JNIEnv, clazz: JClass, fieldID: JFieldID, val: JShort): Void
  fun set_static_int_field = SetStaticIntField(env: JNIEnv, clazz: JClass, fieldID: JFieldID, val: JInt): Void
  fun set_static_long_field = SetStaticLongField(env: JNIEnv, clazz: JClass, fieldID: JFieldID, val: JLong): Void
  fun set_static_float_field = SetStaticFloatField(env: JNIEnv, clazz: JClass, fieldID: JFieldID, val: JFloat): Void
  fun set_static_double_field = SetStaticDoubleField(env: JNIEnv, clazz: JClass, fieldID: JFieldID, val: JDouble): Void

  fun new_string = NewString(env: JNIEnv, unicode: Char*, len: JSize): JString
  fun get_string_length = GetStringLength(env: JNIEnv, str: JString): JSize
  fun get_string_chars = GetStringChars(env: JNIEnv, str: JString, isCopy: JBoolean): JChar*
  fun release_string_chars = ReleaseStringChars(env: JNIEnv, str: JString, chars: JChar*): Void

  fun new_string_utf = NewStringUTF(env: JNIEnv, utf: Char*): JString
  fun new_string_utf_length = GetStringUTFLength(env: JNIEnv, str: JString): JSize
  fun get_string_utf_chars = GetStringUTFChars(env: JNIEnv, str: Char*, isCopy: JBoolean): Char*
  fun release_string_utf_chars = ReleaseStringUTFChars(env: JNIEnv, str: JString, chars: Char*): Void

  fun get_array_length = GetArrayLength(env: JNIEnv, array: JArray): JSize

  fun get_object_array = NewObjectArray(env: JNIEnv, len: JSize, clazz: JClass, init: JObject): JObjectArray
  fun get_object_array_element = GetObjectArrayElement(env: JNIEnv, array: JObjectArray, index: JSize): JObject
  fun set_object_array_element = SetObjectArrayElement(env: JNIEnv, array: JObjectArray, index: JSize, val: JObject): Void

  fun new_boolean_array = NewBooleanArray(env: JNIEnv, len: JSize): JBooleanArray
  fun new_byte_array = NewByteArray(env: JNIEnv, len: JSize): JByteArray
  fun new_char_array = NewCharArray(env: JNIEnv, len: JSize): JCharArray
  fun new_short_array = NewShortArray(env: JNIEnv, len: JSize): JShortArray
  fun new_int_array = NewIntArray(env: JNIEnv, len: JSize): JIntArray
  fun new_long_array = NewLongArray(env: JNIEnv, len: JSize): JLongArray
  fun new_float_array = NewFloatArray(env: JNIEnv, len: JSize): JFloatArray
  fun new_double_array = NewDoubleArray(env: JNIEnv, len: JSize): JDoubleArray

  fun get_boolean_array_elements = GetBooleanArrayElements(env: JNIEnv, array: JBooleanArray, isCopy: JBoolean): JBoolean*
  fun get_byte_array_elements = GetByteArrayElements(env: JNIEnv, array: JByteArray, isCopy: JBoolean): JByte*
  fun get_char_array_elements = GetCharArrayElements(env: JNIEnv, array: JCharArray, isCopy: JBoolean): JChar*
  fun get_short_array_elements = GetShortArrayElements(env: JNIEnv, array: JShortArray, isCopy: JBoolean): JShort*
  fun get_int_array_elements = GetIntArrayElements(env: JNIEnv, array: JIntArray, isCopy: JBoolean): JInt*
  fun get_long_array_elements = GetLongArrayElements(env: JNIEnv, array: JLongArray, isCopy: JBoolean): JLong*
  fun get_float_array_elements = GetFloatArrayElements(env: JNIEnv, array: JFloatArray, isCopy: JBoolean): JFloat*
  fun get_double_array_elements = GetDoubleArrayElements(env: JNIEnv, array: JDoubleArray, isCopy: JBoolean): JDouble*

  fun release_boolean_array_elements = ReleaseBooleanArrayElements(env: JNIEnv, array: JBooleanArray, elems: JBoolean*, mode: JInt): Void
  fun release_byte_array_elements = ReleaseByteArrayElements(env: JNIEnv, array: JByteArray, elems: JByte*, mode: JInt): Void
  fun release_char_array_elements = ReleaseCharArrayElements(env: JNIEnv, array: JCharArray, elems: JChar*, mode: JInt): Void
  fun release_short_array_elements = ReleaseShortArrayElements(env: JNIEnv, array: JShortArray, elems: JShort*, mode: JInt): Void
  fun release_int_array_elements = ReleaseIntArrayElements(env: JNIEnv, array: JIntArray, elems: JInt*, mode: JInt): Void
  fun release_long_array_elements = ReleaseLongArrayElements(env: JNIEnv, array: JLongArray, elems: JLong*, mode: JInt): Void
  fun release_float_array_elements = ReleaseFloatArrayElements(env: JNIEnv, array: JFloatArray, elems: JFloat*, mode: JInt): Void
  fun relase_double_array_elements = ReleaseDoubleArrayElements(env: JNIEnv, array: JDoubleArray, elems: JDouble*, mode: JInt): Void

  fun get_boolean_array_region = GetBooleanArrayRegion(env: JNIEnv, array: JBooleanArray, start: JSize, l: JSize, buf: JBoolean): Void
  fun get_byte_array_region= GetByteArrayRegion(env: JNIEnv, array: JByteArray, start: JSize, len: JSize, buf: JByte): Void
  fun get_char_array_region = GetCharArrayRegion(env: JNIEnv, array: JCharArray, start: JSize, len: JSize, buf: JChar): Void
  fun get_short_array_region = GetShortArrayRegion(env: JNIEnv, array: JShortArray, start: JSize, len: JSize, buf: JShort): Void
  fun get_int_array_region = GetIntArrayRegion(env: JNIEnv, array: JIntArray, start: JSize, len: JSize, buf: JInt): Void
  fun get_long_array_region = GetLongArrayRegion(env: JNIEnv, array: JLongArray, start: JSize, len: JSize, buf: JLong): Void
  fun get_float_array_region = GetFloatArrayRegion(env: JNIEnv, array: JFloatArray, start: JSize, len: JSize, buf: JFloat): Void
  fun get_double_array_region = GetDoubleArrayRegion(env: JNIEnv, array: JDoubleArray, start: JSize, len: JSize, buf: JDouble): Void

  fun set_boolean_array_region = SetBooleanArrayRegion(env: JNIEnv, array: JBooleanArray, start: JSize, l: JSize, buf: JBoolean): Void
  fun set_byte_array_region = SetByteArrayRegion(env: JNIEnv, array: JByteArray, start: JSize, len: JSize, buf: JByte): Void
  fun set_char_array_region = SetCharArrayRegion(env: JNIEnv, array: JCharArray, start: JSize, len: JSize, buf: JChar): Void
  fun set_short_array_region = SetShortArrayRegion(env: JNIEnv, array: JShortArray, start: JSize, len: JSize, buf: JShort): Void
  fun set_int_array_region = SetIntArrayRegion(env: JNIEnv, array: JIntArray, start: JSize, len: JSize, buf: JInt): Void
  fun set_long_array_region = SetLongArrayRegion(env: JNIEnv, array: JLongArray, start: JSize, len: JSize, buf: JLong): Void
  fun set_float_array_region = SetFloatArrayRegion(env: JNIEnv, array: JFloatArray, start: JSize, len: JSize, buf: JFloat): Void
  fun set_double_array_region = SetDoubleArrayRegion(env: JNIEnv, array: JDoubleArray, start: JSize, len: JSize, buf: JDouble): Void

  fun register_natives = RegisterNatives(env: JNIEnv, clazz: JClass, methods: JNINativeMethod*, nMethods: JInt): JInt
  fun unregister_natives = UnregisterNatives(env: JNIEnv, clazz: JClass): JInt

  fun moniter_enter = MonitorEnter(env: JNIEnv, obj: JObject): JInt
  fun moniter_exit = MonitorExit(env: JNIEnv, obj: JObject): JInt

  fun get_java_vm = GetJavaVM(env: JNIEnv, vm: JavaVM): JInt

  fun get_string_region = GetStringRegion(env: JNIEnv, str: JString, start: JSize, len: JSize, buf: JChar): Void
  fun get_string_utf_region = GetStringUTFRegion(env: JNIEnv, str: JString, start: JSize, len: JSize, buf: Char*): Void

  fun get_primitive_array_critical = GetPrimitiveArrayCritical(env: JNIEnv, array: JArray, isCopy: JBoolean): Void*
  fun release_primitive_array_critical = ReleasePrimitiveArrayCritical(env: JNIEnv, array: JArray, carray: Void, mode: JInt): Void

  fun get_string_critial = GetStringCritical(env: JNIEnv, str: JString, isCopy: JBoolean): JChar*
  fun release_string_critical = ReleaseStringCritical(env: JNIEnv, str: JString, cstring: JChar*): Void

  fun new_weal_global_ref = NewWeakGlobalRef(env: JNIEnv, obj: JObject): JWeak
  fun delete_weak_global_ref = DeleteWeakGlobalRef(env: JNIEnv, ref: JWeak): Void

  fun exception_check = ExceptionCheck(env: JNIEnv): JBoolean

  fun new_direct_byte_buffer = NewDirectByteBuffer(env: JNIEnv, address: Void*, capacity: JLong): JObject
  fun get_direct_buffer_address = GetDirectBufferAddress(env: JNIEnv, buf: JObject): Void*
  fun get_direct_buffer_capacity = GetDirectBufferCapacity(env: JNIEnv, buf: JObject): JLong

  # New JNI 1.6 Features

  fun get_object_ref_type = GetObjectRefType(env: JNIEnv, obj: JObject): JObjectRefType

end
