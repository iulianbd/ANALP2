/**
 *
 * Descripcion: Implementation of sorting functions
 *
 * Fichero: sorting.c
 * Autor: Carlos Aguirre
 * Version: 1.0
 * Fecha: 16-09-2019
 *
 */


#include "sorting.h"

#include <stdio.h>

/***************************************************/
/* Function: InsertSort    Date: 7/10/2026         */
/* Author: Raducu Iulian Bidila                    */
/***************************************************/
int InsertSort(int* array, int ip, int iu)
{
  int i, j, a, n = 0;
  if (!array || ip < 0 || iu < 0 || ip > iu) {
    return ERR;
  }

  for (i = ip+1; i <= iu; i++) {
    a = array[i];
    j = i - 1;

    while (j >= ip) {
      n++;
      if (array[j] > a) {
        array[j+1] = array[j];
        j--;
      } else {
          break;
      }
    }

    array[j+1] = a;
  }

  return n;
}


/***************************************************/
/* Function: BubbleSort    Date: 7/10/2026         */
/* Author: Raducu Iulian Bidila                    */
/***************************************************/
int BubbleSort(int* array, int ip, int iu)
{
  int i, j, temp, ob = 0;

  if (array == NULL || ip < 0 || ip > iu) {
    return ERR;
  }

  for (i = ip; i < iu; i++) {
    for (j = iu; j > i; j--) {
      ob++;
      if (array[j] < array[j - 1]) {
        temp = array[j];
        array[j] = array[j - 1];
        array[j - 1] = temp;
      }
    }
  }

  return ob;
}

int pivot_min(int* array, int ip, int iu, int* pos)
{
  if (array == NULL || pos == NULL || ip < 0 || ip > iu) {
    return ERR;
  }

  *pos = ip;
  return 0;
}

int partition(int* array, int ip, int iu, int* pos, pfunc_pivot pivot)
{
  int p, k, i, temp, ob_pivot, ob = 0;

  if (array == NULL || pos == NULL || pivot == NULL || ip < 0 || ip > iu) {
    return ERR;
  }

  ob_pivot = pivot(array, ip, iu, &p);
  if (ob_pivot == ERR) {
    return ERR;
  }

  k = array[p];
  temp = array[ip];
  array[ip] = array[p];
  array[p] = temp;

  p = ip;
  for (i = ip + 1; i <= iu; i++) {
    ob++;
    if (array[i] < k) {
      p++;
      temp = array[i];
      array[i] = array[p];
      array[p] = temp;
    }
  }

  temp = array[ip];
  array[ip] = array[p];
  array[p] = temp;

  *pos = p;
  return ob + ob_pivot;
}

int QuickSort_min(int* array, int ip, int iu)
{
  int pos, ob_part, ob_izq, ob_der;

  if (array == NULL || ip < 0) {
    return ERR;
  }

  if (ip >= iu) {
    return 0;
  }

  ob_part = partition(array, ip, iu, &pos, pivot_min);
  if (ob_part == ERR) {
    return ERR;
  }

  ob_izq = QuickSort_min(array, ip, pos - 1);
  if (ob_izq == ERR) {
    return ERR;
  }

  ob_der = QuickSort_min(array, pos + 1, iu);
  if (ob_der == ERR) {
    return ERR;
  }

  return ob_part + ob_izq + ob_der;
}

int pivot_mean(int* array, int ip, int iu, int* pos)
{
  if (array == NULL || pos == NULL || ip < 0 || ip > iu) {
    return ERR;
  }

  *pos = ip + (iu - ip) / 2;
  return 0;
}

int QuickSort_mean(int* array, int ip, int iu)
{
  int pos, ob_part, ob_izq, ob_der;

  if (array == NULL || ip < 0) {
    return ERR;
  }

  if (ip >= iu) {
    return 0;
  }

  ob_part = partition(array, ip, iu, &pos, pivot_mean);
  if (ob_part == ERR) {
    return ERR;
  }

  ob_izq = QuickSort_mean(array, ip, pos - 1);
  if (ob_izq == ERR) {
    return ERR;
  }

  ob_der = QuickSort_mean(array, pos + 1, iu);
  if (ob_der == ERR) {
    return ERR;
  }

  return ob_part + ob_izq + ob_der;
}

int pivot_median(int* array, int ip, int iu, int* pos)
{
  int im, ob = 0;

  if (array == NULL || pos == NULL || ip < 0 || ip > iu) {
    return ERR;
  }

  im = ip + (iu - ip) / 2;

  ob++;
  if (array[ip] < array[im]) {
    ob++;
    if (array[im] < array[iu]) {
      *pos = im;
    } else {
      ob++;
      if (array[ip] < array[iu]) {
        *pos = iu;
      } else {
        *pos = ip;
      }
    }
  } else {
    ob++;
    if (array[ip] < array[iu]) {
      *pos = ip;
    } else {
      ob++;
      if (array[im] < array[iu]) {
        *pos = iu;
      } else {
        *pos = im;
      }
    }
  }

  return ob;
}

int QuickSort_median(int* array, int ip, int iu)
{
  int pos, ob_part, ob_izq, ob_der;

  if (array == NULL || ip < 0) {
    return ERR;
  }

  if (ip >= iu) {
    return 0;
  }

  ob_part = partition(array, ip, iu, &pos, pivot_median);
  if (ob_part == ERR) {
    return ERR;
  }

  ob_izq = QuickSort_median(array, ip, pos - 1);
  if (ob_izq == ERR) {
    return ERR;
  }

  ob_der = QuickSort_median(array, pos + 1, iu);
  if (ob_der == ERR) {
    return ERR;
  }

  return ob_part + ob_izq + ob_der;
}

int merge(int* array, int ip, int iu, int im)
{
  int i = ip, j = im + 1, k = 0, ob = 0;
  int *aux = NULL;

  if (!array || ip < 0 || iu < 0 || im < ip || im > iu) {
    return ERR;
  }

  aux = (int*)malloc((iu - ip + 1) * sizeof(int));
  if (!aux) {
    return ERR;
  }

  while (i <= im && j <= iu) {
    ob++;
    if (array[i] <= array[j]) {
      aux[k++] = array[i++];
    } else {
      aux[k++] = array[j++];
    }
  }

  while (i <= im) {
    aux[k++] = array[i++];
  }

  while (j <= iu) {
    aux[k++] = array[j++];
  }

  for (i = ip, k = 0; i <= iu; i++, k++) {
    array[i] = aux[k];
  }

  free(aux);
  return ob;
}

int MergeSort(int* array, int ip, int iu)
{
  int im, ob_izq, ob_der, ob_merge;

  if (!array || ip < 0 || iu < 0) {
    return ERR;
  }

  if (ip >= iu) {
    return 0;
  }

  im = ip + (iu - ip) / 2;

  ob_izq = MergeSort(array, ip, im);
  if (ob_izq == ERR) return ERR;

  ob_der = MergeSort(array, im + 1, iu);
  if (ob_der == ERR) return ERR;

  ob_merge = merge(array, ip, iu, im);
  if (ob_merge == ERR) return ERR;

  return ob_izq + ob_der + ob_merge;
}

